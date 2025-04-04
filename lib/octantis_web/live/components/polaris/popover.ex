defmodule OctantisWeb.Components.Polaris.Popover do
  @moduledoc """
  Popovers are small overlays that open on demand. They let merchants access additional content and actions without cluttering the page.
  ## Examples
    ```elixir
    <.popover id="someid">
      <:activator content="More Actions"/>
      <:action content="Import"/>
      <:action content="Export"/>
    </.popover>
    ```

  See
   - https://polaris.shopify.com/components/overlays/popover
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Popover/Popover.tsx
  """

  use OctantisWeb.Core

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([:block_stack, :box, :complex_action, :inline_stack])

  alias Phoenix.LiveView.JS
  alias OctantisWeb.Components.Polaris.ComplexAction

  @doc @moduledoc

  attr :id, :string, required: true, doc: "DOM id of the popover`s parent"
  attr :popover_id, :string, doc: "DOM id of the popover"

  # attr :children?: React.ReactNode,
  # doc: "The content to display inside the popover"

  attr :preferred_position, :string,
    values: ["above", "below", "mostSpace", "cover"],
    doc: "The preferred direction to open the popover"

  attr :preferred_alignment, :string,
    values: ["left", "center", "right"],
    doc: "The preferred alignment of the popover relative to its activator"

  attr :active, :boolean, doc: "Show or hide the Popover", default: true

  # attr :preferInputActivator?: PopoverOverlayProps['preferInputActivator'], default true,
  # doc: "Use the activator's input element to calculate the Popover position"

  # attr : activatorWrapper?: string, default 'div',
  # doc: "The element type to wrap the activator with"

  attr :z_index_override, :integer,
    default: nil,
    doc: "Override on the default z-index of 400"

  # attr : preventFocusOnClose?: boolean,
  # doc: "Prevents focusing the activator or the next focusable element when the popover is deactivated"

  # attr : sectioned?: boolean,
  # doc: "Automatically add wrap content in a section"

  attr :full_width, :boolean, doc: "Allow popover to stretch to the full width of its activator"

  # attr : fullHeight?: boolean,
  # doc: "Allow popover to stretch to fit content vertically"

  # attr : fluidContent?: boolean,
  # doc: "Allow popover content to determine the overlay width and height"

  # attr : fixed?: boolean,
  # doc: "Remains in a fixed position"

  # attr : ariaHaspopup?: AriaAttributes['aria-haspopup'],
  # doc: "Used to illustrate the type of popover element"

  # attr : hideOnPrint?: boolean,
  # doc: "Allow the popover overlay to be hidden when printing"

  attr :on_close, :any, default: nil, doc: "Callback when popover is closed"

  # attr : autofocusTarget?: PopoverAutofocusTarget, @default 'container',
  # doc: "The preferred auto focus target defaulting to the popover container"

  attr :prevent_close_on_child_overlay_click, :boolean,
    default: false,
    doc: "Prevents closing the popover when other overlays are clicked"

  # attr : captureOverscroll?: boolean, default false,
  # doc: "Prevents page scrolling when the end of the scrollable
  # Popover overlay content is reached - applied to Pane subcomponent"

  slot :activator, required: true

  slot :action, validate_attrs: true do
    ComplexAction.attributes()
  end

  slot :section

  slot :inner_block

  def popover(assigns) do
    assigns =
      assigns
      |> assign_new(:popover_id, fn %{id: id} -> popover_id(id) end)
      |> assign(:class, class(assigns))

    ~H"""
    <div>
      <%= for activator <- @activator do %>
        {render_slot(activator, %{phx_click: show_popover(@popover_id)})}
      <% end %>
    </div>
    <div
      id={@popover_id}
      data-portal-id="popover-:r0:"
      class="p-theme-light Polaris-ThemeProvider--themeContainer"
    >
      <div
        class="Polaris-PositionedOverlay Polaris-Popover__PopoverOverlay"
        style="display:none;"
        {phx_bindings(%{phx_click_away: hide_popover(@popover_id)})}
      >
        <div class={["Polaris-Popover", @class]} data-polaris-overlay="true">
          <div class="Polaris-Popover__FocusTracker" tabindex="0"></div>
          <div class="Polaris-Popover__ContentContainer">
            <div tabindex="-1" class="Polaris-Popover__Content">
              <div
                class="Polaris-Popover__Pane Polaris-Scrollable Polaris-Scrollable--vertical Polaris-Scrollable--horizontal Polaris-Scrollable--scrollbarWidthThin"
                data-polaris-scrollable="true"
              >
                <.box :if={@action != []} data-polaris="ActionList" as="div" role="menu">
                  <.box as="div" padding={[xs: "150"]} tabindex="-1">
                    <.block_stack gap={[xs: "050"]} as="ul">
                      <.box :for={action <- @action} as="li">
                        <.inline_stack wrap={false}>
                          <.complex_action
                            variant="tertiary"
                            {action}
                            phx_click={(action[:phx_click] || %JS{}) |> hide_popover(@popover_id)}
                          />
                        </.inline_stack>
                      </.box>
                    </.block_stack>
                  </.box>
                </.box>
                {render_slot(@inner_block)}
              </div>
            </div>
          </div>
          <div class="Polaris-Popover__FocusTracker" tabindex="0"></div>
        </div>
      </div>
    </div>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:full_width, true}), do: ["Polaris-Popover--fullWidth"]
  defp build_class({_key, _value}), do: []

  def show_popover(js \\ %JS{}, id) do
    js
    |> JS.add_class("Polaris-Popover__PopoverOverlay--open",
      to: "##{id} .Polaris-PositionedOverlay"
    )
    |> JS.show(to: "##{id} .Polaris-PositionedOverlay")
  end

  def hide_popover(js \\ %JS{}, id) do
    js
    |> JS.remove_class("Polaris-Popover__PopoverOverlay--open",
      to: "##{id} .Polaris-PositionedOverlay"
    )
    |> JS.hide(to: "##{id} .Polaris-PositionedOverlay")
  end

  def popover_id(id), do: "Popover" <> to_string(id)
end
