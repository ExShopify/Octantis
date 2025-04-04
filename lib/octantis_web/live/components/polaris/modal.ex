defmodule OctantisWeb.Components.Polaris.Modal do
  @moduledoc """
  Modals are overlays that require merchants to take an action before they can continue interacting with the rest of Shopify. They can be disruptive and should be used thoughtfully and sparingly.

  Polaris marks this component as `Deprecated` and suggests you use the AppBridge Modal instead.
  However, the AppBridge Modal is severly limited and it might be best to still use this for the time being.

  See
   - https://polaris.shopify.com/components/deprecated/modal
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Modal/Modal.tsx


  ## Open a modal from the server

  ```javascript
  Hooks.ShopifyModal = {
    mounted(){
      id = this.el.id
      this.handleEvent(`polaris:modal_show_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-show")))
      this.handleEvent(`polaris:modal_hide_${id}`, (event) => this.liveSocket.execJS(this.el, this.el.getAttribute("data-hide")))
    }
  }
  ```

  ```elixir
  <.modal id="my_modal_id" title="My Modal" phx_hook="ShopifyModal">
    Content
    <:action content="Ok"/>
  </.modal>
  ```

  ```elixir
  {:noreply, socket |> Modal.push_open("my_modal_id")}
  ```
  """

  use OctantisWeb.Core

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([
    :block_stack,
    :box,
    :button,
    :complex_action,
    :inline_grid,
    :inline_stack,
    :spinner
  ])

  alias OctantisWeb.Components.Polaris.ComplexAction
  alias OctantisWeb.Components.Polaris.Icons

  attr :id, :string, required: true, doc: "id of the modal"

  attr :title_hidden, :boolean, default: false, doc: "Hide the title in the modal."

  attr :open, :boolean, default: false, doc: "Whether the modal is open or not"

  # attr :instant, :boolean, default: true, doc: "Disable animations and open modal instantly."

  attr :size, :string,
    default: nil,
    values: ["small", "large", "fullScreen", nil],
    doc: "Set the size of the modal"

  attr :tone, :string,
    default: "tertiary",
    values: ["success", "info", "warning", "critical", "tertiary"],
    doc: "Sets the status of the banner."

  attr :title, :string, default: "", doc: "The content for the title of the modal."

  attr :limit_height, :boolean,
    default: false,
    doc: "Limits modal height on large sceens with scrolling."

  attr :loading, :boolean,
    default: false,
    doc: "Replaces modal content with a spinner while a background action is being performed."

  attr :on_close, :any, doc: "Callback when the modal clsoe button is clicked."

  # attr :no_scroll, :boolean,
  #   default: false,
  #   doc: "Removes Scrollable container from the modal content."

  # slot :activator, doc: "The complex action that activates the modal"

  slot :inner_block

  slot :action, validate_attrs: true do
    ComplexAction.attributes()
  end

  slot :secondary_action, validate_attrs: true do
    ComplexAction.attributes()
  end

  slot :footer, doc: "Override the primary and secondary actions and include your own footer."

  attr :phx_hook, :string, default: nil

  def modal(assigns) do
    assigns =
      assigns
      |> assign_new(:on_close, fn -> hide(assigns.id) end)
      |> assign(:class, class(assigns))
      |> assign_phx_bindings()
      |> assign_background()
      |> assign_color()
      |> assign_new(:hidden, fn -> !assigns.open end)

    ~H"""
    <div id={wrapper_id(@id)} hidden={@hidden} {@bindings} data-show={show(@id)} data-hide={hide(@id)}>
      <div>
        <div class="Polaris-Modal-Dialog__Container">
          <div>
            <div role="dialog" aria-modal="true" tabindex="-1" class="Polaris-Modal-Dialog">
              <div class={["Polaris-Modal-Dialog__Modal", @class]}>
                <.box
                  :if={!@title_hidden}
                  background={@background}
                  color={@color}
                  border_color="border"
                  border_style="solid"
                  border_block_end_width="025"
                  padding={[xs: "400"]}
                >
                  <.inline_grid columns={[xs: "1fr auto"]} gap={[xs: "400"]}>
                    <.inline_stack block_align="center" wrap={true} gap={[xs: "400"]}>
                      <h2 class="Polaris-Text--root Polaris-Text--headingMd Polaris-Text--break">
                        {@title}
                      </h2>
                    </.inline_stack>

                    <.button :if={@on_close} variant={@tone} phx_click={@on_close}>
                      <:icon><Icons.x /></:icon>
                    </.button>
                  </.inline_grid>
                </.box>

                <div
                  class="Polaris-Modal__Body Polaris-Scrollable Polaris-Scrollable--vertical Polaris-Scrollable--horizontal Polaris-Scrollable--scrollbarWidthThin"
                  data-polaris-scrollable="true"
                >
                  <div :if={!@loading} class="Polaris-Modal-Section">
                    <.box padding={[xs: "400"]} as="section">
                      {render_slot(@inner_block)}
                    </.box>
                  </div>
                  <.box :if={@loading} padding={[xs: "400"]}>
                    <.inline_stack gap={[xs: "400"]} align="center" block_align="center">
                      <.spinner accessibility_label="loading" />
                    </.inline_stack>
                  </.box>
                </div>

                <.inline_stack block_align="center" wrap={true} gap={[xs: "400"]}>
                  <.box
                    border_color="border"
                    border_style="solid"
                    border_block_start_width="025"
                    padding={[xs: "400"]}
                    width="100%"
                  >
                    <.slot_wrapper slot={@title}>
                      <.inline_stack
                        align="space-between"
                        block_align="center"
                        wrap={true}
                        gap={[xs: "400"]}
                      >
                        <.box></.box>
                        <.inline_stack wrap={true} gap={[xs: "200"]}>
                          <.complex_action :for={action <- @secondary_action} {action} />
                          <.complex_action
                            :for={action <- @action}
                            {action}
                            variant="primary"
                            size="medium"
                          />
                        </.inline_stack>
                      </.inline_stack>
                    </.slot_wrapper>
                  </.box>
                </.inline_stack>
              </div>
            </div>
          </div>
        </div>
      </div>

      <.backdrop phx_click={@on_close} />
    </div>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:limit_height, true}), do: [@class_prefix <> "-Dialog--limitHeight"]
  defp build_class({:size, "small"}), do: [@class_prefix <> "-Dialog--sizeSmall"]
  defp build_class({:size, "large"}), do: [@class_prefix <> "-Dialog--sizeLarge"]
  defp build_class({:size, "fullScreen"}), do: [@class_prefix <> "-Dialog--sizeFullScreen"]

  defp build_class({_key, _value}), do: []

  attr :phx_click, :string, default: nil

  def backdrop(assigns) do
    assigns = assigns |> assign_phx_bindings()

    ~H"""
    <div class="Polaris-Backdrop" {@bindings}></div>
    """
  end

  def assign_color(%{tone: value} = assigns),
    do: assign_new(assigns, :color, fn -> "text-#{value}-on-bg-fill" end)

  def assign_background(%{tone: value} = assigns),
    do: assign_new(assigns, :background, fn -> "bg-fill-#{value}" end)

  def wrapper_id(id), do: "ModalWrapper" <> id
  def backdrop_id(id), do: "ModalBackdrop" <> id

  def show(js \\ %JS{}, id), do: JS.show(js, to: "#" <> wrapper_id(id))
  def hide(js \\ %JS{}, id), do: JS.hide(js, to: "#" <> wrapper_id(id))

  def push_open(socket, id),
    do: Phoenix.LiveView.push_event(socket, "polaris:modal_show_" <> wrapper_id(id), %{})

  def push_close(socket, id),
    do: Phoenix.LiveView.push_event(socket, "polaris:modal_hide_" <> wrapper_id(id), %{})
end
