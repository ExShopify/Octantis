defmodule OctantisWeb.Components.Polaris.Tabs do
  @moduledoc """
  Use to alternate among related views within the same context.

  ## Examples
  ```elixir
  <.card padding={[xs: "0"]}>
    <.tabs id="customers">
      <:tab
        content="All"
        accessibility_label="All customers"
      >
        <.box padding={[md: "200"]}>All Customers</.box>
      </:tab>
      <:tab content="Accepts marketing">
        <.box padding={[md: "200"]}>Accepts marketing</.box>
      </:tab>
      <:tab
        content="Repeat customers"
        accessibility_label="Repeat customers"
      >
        <.box padding={[md: "200"]}>Repeat customers</.box>
      </:tab>
      <:tab content="Prospects">
        <.box padding={[md: "200"]}>Prospects</.box>
      </:tab>
    </.tabs>
  </.card>
  ```

  ## See
   - https://polaris.shopify.com/components/navigation/tabs
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Tabs/Tabs.tsx
  """

  use OctantisWeb.Core

  import_polaris_components([
    :badge,
    :block_stack,
    :box,
    :image,
    :inline_stack,
    :text,
    :thumbnail,
    :unstyled_button
  ])

  @doc @moduledoc

  attr :id, :string, required: true

  # attr :tabs, :TabProps[], doc: "The items that map to each Tab."

  # attr :children,  :React.ReactNode, doc: "Content to display in tabs"

  attr :selected, :integer, default: 0, doc: "The index of the currently selected Tab."

  attr :disabled, :boolean, default: false, doc: "Whether the Tabs are disabled or not."

  # attr :can_create_new_view,  :boolean, doc: "Whether to show the add new view Tab."

  # attr :new_view_accessibility_label, :string,
  #     doc: "Label for the new view Tab. Will override the default of "Create new view""

  # attr :fitted,  :boolean, doc: "Fit tabs to container"

  # attr :disclosure_text,  :string, doc: "Text to replace disclosures horizontal dots"

  # attr :disclosure_z_index_override,  :number, doc: "Override z-index of popovers and tooltips"

  # attr :on_select,  :(selectedTabIndex: number) => void, doc: "Optional callback invoked when a Tab becomes selected."

  # attr :on_create_new_view,  :(value: string) => Promise<boolean>,
  #     doc: "Optional callback invoked when a merchant saves a new view from the Modal"

  attr :bottom_tabs, :boolean, default: false, doc: "Should the tabs be below the content?"

  attr :inline_align, :string,
    default: nil,
    doc: "Horizontal alignment of children",
    values: ["start", "center", "end", "baseline", "stretch", nil]

  attr :phx_focus, :any, default: nil, doc: "onFocus"
  attr :phx_blur, :any, default: nil, doc: "onBlur"
  attr :phx_keydown, :any, default: nil, doc: "onKeyDown"
  attr :phx_keyup, :any, default: nil, doc: "onKeyUp"

  slot :tab do
    attr :accessibility_label, :any
    # attr :badge, :any, default: nil
    attr :id, :any
    attr :panel_id, :any
    attr :content, :string

    attr :disabled, :any
    # attr :is_modal_loading, :any, default: nil
    # attr :icon, :boolean, default: false
    # attr :measuring, :any, default: nil
    # attr :focused, :any, default: nil
    attr :selected, :integer
    attr :phx_focus, :any
    attr :phx_keydown, :any
    attr :phx_click, :any

    attr :phx_target, :any
  end

  slot :block_stack

  def tabs(assigns) do
    assigns =
      assigns
      |> assign_new(:tab_to_focus, fn -> nil end)
      |> assign_new(:phx_click, fn -> nil end)
      |> assign_phx_bindings()

    ~H"""
    <.block_stack class="Polaris-Tabs__Outer" id={@id} gap={[xs: 0]} {slot_attributes(@block_stack)}>
      <.box padding={[md: "200"]}>
        <%!-- {tabMeasurer} --%>
        <div class="Polaris-Tabs__Wrapper">
          <div class="Polaris-Tabs__ButtonWrapper">
            <ul role={if length(@tab) > 0, do: "tablist"} class="Polaris-Tabs" {@bindings}>
              <.tab
                :for={{tab, index} <- Enum.with_index(@tab)}
                {tab}
                id={tab_id(@id, index)}
                disabled={@disabled || tab[:disabled]}
                sibling_tab_has_focus={@tab_to_focus > -1}
                focused={index == @tab_to_focus}
                selected={index == @selected}
                phx_click={select_tab(@id, index)}
                accessibility_label={tab[:accessibility_label]}
                content={tab[:content]}
              />
              <%!-- {mdDown || tabsToShow.length ...  --%>
            </ul>
            <%!-- {canCreateNewView ... } --%>
          </div>
        </div>
      </.box>

      <div
        :for={{tab, index} <- Enum.with_index(@tab)}
        class={["Polaris-Tabs__Panel", if(index != @selected, do: "Polaris-Tabs__Panel--hidden")]}
        id={panel_id(@id, index)}
        role="tabpanel"
        aria-labelledby={tab_id(@id, index)}
        tabIndex={-1}
        style={extra_styles(tab)}
      >
        {render_slot(tab)}
      </div>
    </.block_stack>
    """
  end

  def tab_id(id, index), do: "#{id}-#{index}-tab"
  def panel_id(id, index), do: tab_id(id, index) <> "panel"

  # attr :url, :any, default: nil
  # attr :actions, :any, default: nil
  # attr :measuring, :any, default: nil

  attr :accessibility_label, :string, default: nil
  attr :badge, :any, default: nil
  attr :id, :any, default: nil
  attr :panel_id, :any, default: nil
  attr :content, :string, default: nil
  attr :image_source, :string, default: nil

  attr :disabled, :any, default: false
  # attr :is_modal_loading, :any, default: nil
  attr :sibling_tab_has_focus, :boolean, default: false
  attr :focused, :any, default: nil
  attr :selected, :boolean, default: false
  # attr :on_toggle_modal, :any, default: nil
  # attr :on_toggle_popover, :any, default: nil
  # attr :view_names, :any, default: nil
  # attr :tab_index_override, :any, default: nil
  # attr :disclosure_z_index_override, :any, default: nil

  attr :phx_focus, :any, default: nil, doc: "onFocus"
  attr :phx_keydown, :any, default: nil, doc: "onKeyDown"
  attr :phx_click, :any, default: nil, doc: "onClick"

  attr :phx_target, :any, default: nil, doc: "Allows setting the target for the button"

  def tab(assigns) do
    assigns =
      assigns
      |> assign(:tab_button_class, build_tab_button_class(assigns))
      |> assign(:tab_button_style, build_tab_button_style(assigns))
      |> assign_new(:accessibility_label, fn -> assigns.content end)

    ~H"""
    <li class="Polaris-Tabs__TabContainer" role="presentation">
      <.unstyled_button
        id={@id}
        class={["Polaris-Tabs__Tab", @tab_button_class]}
        style={@tab_button_style}
        aria-selected={@selected}
        aria-controls={@panel_id}
        aria-label={@accessibility_label}
        role="tab"
        disabled={@disabled}
        phx_focus={@phx_focus}
        phx_click={@phx_click}
        phx_keydown={@phx_keydown}
      >
        <.inline_stack gap={[xs: "200"]} align="center" block_align="center" wrap={false}>
          <.text :if={@content} as="span" variant="bodySm" font_weight="medium">
            {@content}
          </.text>
          <.badge :if={@badge} tone={if !@selected, do: "new"}>{@badge}</.badge>
        </.inline_stack>
        <.thumbnail :if={@image_source} source={@image_source} alt={@accessibility_label} />
      </.unstyled_button>
    </li>
    """
  end

  def build_tab_button_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&tab_button_class/1) |> Enum.join(" ")

  defp tab_button_class({:selected, true}), do: ["Polaris-Tabs__Tab--active"]
  defp tab_button_class({:icon, true}), do: ["Polaris-Tabs__Tab--iconOnly"]

  defp tab_button_class({:image_source, value}) when is_binary(value),
    do: ["Polaris-Tabs__Tab--iconOnly"]

  defp tab_button_class({_key, _value}), do: []

  def build_tab_button_style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&tab_button_style/1) |> Enum.join(" ")

  defp tab_button_style({:image_source, value}) when is_binary(value),
    do: ["width: unset; height: unset;"]

  defp tab_button_style({_key, _value}), do: []

  def select_tab(js \\ %JS{}, id, index) do
    js
    |> JS.add_class("Polaris-Tabs__Panel--hidden", to: "##{id} .Polaris-Tabs__Panel")
    |> JS.remove_class("Polaris-Tabs__Panel--hidden", to: "##{panel_id(id, index)}")
    |> JS.remove_class("Polaris-Tabs__Tab--active", to: "##{id} .Polaris-Tabs__Tab")
    |> JS.remove_class("Polaris-Tabs__Panel--hidden",
      to: "##{tab_id(id, index)} .Polaris-Tabs__Tab"
    )
    |> JS.add_class("Polaris-Tabs__Tab--active", to: "##{tab_id(id, index)}")
  end
end
