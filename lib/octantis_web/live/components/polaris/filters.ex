defmodule OctantisWeb.Components.Polaris.Filters do
  @moduledoc """
  Filters is a composite component that filters the items of a list or table.

  ## Examples
  ```elixir
  </.skeleton_display_text>
  ```

  ## See
   - https://polaris.shopify.com/components/selection-and-input/filters
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Filters/Filters.tsx
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Filters/components/FiltersBar/FiltersBar.tsx
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Filters/components/FilterPill/FilterPill.tsx
  """

  defmodule Filter do
    @moduledoc """
    The struct for holding a filter.
    """

    defstruct [
      :key,
      :label,
      :value,
      :filter_component,
      shortcut: false,
      disabled: false,
      pinned: false,
      applied: false,
      hide_clear_button: true,
      on_action: nil,
      section: nil,
      hidden: false,
      choices: []
    ]

    defmodule Choice do
      @moduledoc """
      Choices for filters
      """

      defstruct [
        :label,
        :value,
        :selected
      ]
    end
  end

  use OctantisWeb.Core, :component

  require OctantisWeb.Components.Polaris.ComplexAction

  alias OctantisWeb.Components.Polaris.Icons

  import_polaris_components([
    :block_stack,
    :box,
    :button,
    :choice_list,
    :icon,
    :inline_stack,
    :popover,
    :text,
    :text_field,
    :unstyled_button
  ])

  @doc @moduledoc
  attr :id, :string, required: true

  attr :query_form, Phoenix.HTML.Form,
    default: nil,
    doc: "The form that controls the query field",
    examples: [Phoenix.Component.to_form(%{"value" => "Search string"})]

  attr :query_placeholder, :string, default: nil, doc: "Placeholder text for the query field."

  attr :focused, :boolean, default: false, doc: "Whether the query field is focused."

  attr :filters, :list,
    default: [],
    doc:
      "Available filters added to the filter bar. Shortcut filters are pinned to the front of the bar."

  attr :on_query_change, :any, default: nil, doc: "Callback when the query field is changed."

  attr :on_query_clear, :any, default: nil, doc: "Callback when the clear button is triggered."

  attr :on_clear_all, :any, default: nil, doc: "Callback when the reset all button is pressed."

  attr :on_toggle_filter, :any,
    default: nil,
    doc: "Callback for when a filter is applied or unapplied."

  attr :on_query_blur, :any, default: nil, doc: "Callback when the query field is blurred."

  attr :on_query_focus, :any, default: nil, doc: "Callback when the query field is focused."

  attr :disabled, :boolean, default: false, doc: "Disable all filters."

  attr :hide_filters, :boolean, default: false, doc: "Hide filter bar for applied filters."

  attr :hide_query_field, :boolean, default: false, doc: "Hide the query field."

  attr :disable_query_field, :boolean, default: false, doc: "Disable the query field."

  attr :disable_filters, :boolean, default: false, doc: "Disable the filters"

  attr :borderless_query_field, :boolean,
    default: false,
    doc:
      "Whether the text field should be borderless. Should be true when used as part of the IndexFilters component."

  attr :loading, :boolean,
    default: false,
    doc: "Whether an asyncronous task is currently being run."

  slot :query_bar

  slot :filter_bar

  def filters(assigns) do
    assigns =
      assigns
      |> assign(:class, build_class(assigns))
      |> assign_default_nil([
        :on_clear_all,
        :on_add_filter_click,
        :close_on_child_overlay_click
      ])
      |> assign(:phx_debounce, "200")
      |> assign(:phx_submit, assigns.on_query_change)
      |> assign(:phx_change, assigns.on_query_change)
      |> assign_phx_bindings([:phx_submit, :phx_change, :phx_debounce, :phx_throttle])

    ~H"""
    <div class={@class} id={@id}>
      <.form for={@query_form} {@bindings}>
        <.query_field
          :if={@query_form}
          id={@id}
          phx_focus={@on_query_focus}
          phx_blur={@on_query_blur}
          on_clear={@on_query_clear}
          query_form={@query_form}
          placeholder={@query_placeholder}
          focused={@focused}
          disabled={@disabled || @disable_query_field}
          borderless_query_field={@borderless_query_field}
          loading={@loading}
        >
          {render_slot(@query_bar)}
        </.query_field>
        <.filters_bar
          :if={!@hide_filters}
          id={@id}
          filters={@filters}
          on_clear_all={@on_clear_all}
          on_toggle_filter={@on_toggle_filter}
          disabled={@disabled}
          hide_query_field={!!@query_form}
          disable_filters={@disable_filters}
          on_add_filter_click={@on_add_filter_click}
          close_on_child_overlay_click={@close_on_child_overlay_click}
        >
          {render_slot(@filter_bar)}
        </.filters_bar>
      </.form>
    </div>
    """
  end

  def build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&class/1) |> Enum.join(" ")

  defp class({:query_form, value}) when not is_nil(value), do: ["Polaris-Filters--hideQueryField"]
  defp class({_key, _value}), do: []

  attr :id, :string, required: true

  attr :filters, :list,
    default: [],
    doc:
      "Available filters added to the filter bar. Shortcut filters are pinned to the front of the bar."

  # attr :applied_filters, :list, default: [],
  #  doc: "Applied filters which are rendered as filter pills. The remove callback is called with the respective key."

  attr :on_clear_all, :any, default: nil, doc: "Callback when the reset all button is pressed."

  attr :on_toggle_filter, :any,
    default: nil,
    doc: "Callback for when a filter is applied or unapplied."

  attr :disabled, :boolean, default: false, doc: "Disable all filters."

  attr :hide_query_field, :boolean, default: false, doc: "Hide the query field."

  attr :disable_filters, :boolean, default: false, doc: "Disable the filters"

  attr :on_add_filter_click, :any,
    default: nil,
    doc: "Callback when the add filter button is clicked."

  attr :close_on_child_overlay_click, :boolean,
    default: false,
    doc: "Whether the filter should close when clicking inside another Popover."

  slot :inner_block

  def filters_bar(assigns) do
    pinned_filters = Enum.filter(assigns.filters, & &1.pinned)
    selected_filters = Enum.filter(assigns.filters, &has_active_choice(&1))
    show_add_button = Enum.any?(assigns.filters, &(!&1.pinned))

    assigns =
      assigns
      |> assign(:pinned_filters, pinned_filters)
      |> assign(:selected_filters, selected_filters)
      |> assign(:show_add_button, show_add_button)
      |> assign_default_nil([
        :handle_filter_pill_remove
      ])

    ~H"""
    <div class="">
      <div class="Polaris-Filters__FiltersWrapper" aria-live="polite">
        <div class="Polaris-Filters__FiltersInner">
          <div class="Polaris-Filters__FiltersStickyArea">
            <.filter_pill
              :for={filter <- @pinned_filters}
              id={@id}
              filter_key={filter.key}
              label={filter.label}
              hide_clear_button={filter.hide_clear_button}
              initial_active={!filter.pinned && !Enum.any?(filter.choices, & &1.selected)}
              selected={!Enum.any?(filter.choices, & &1.selected)}
              on_remove={@handle_filter_pill_remove}
              disabled={filter.disabled || @disable_filters}
              close_on_child_overlay_click={@close_on_child_overlay_click}
            >
              <:filter>
                <.choice_list
                  id={@id <> to_string(filter.key)}
                  name={filter.key}
                  title={filter.label}
                  title_hidden
                  allow_multiple
                  phx_change={@on_toggle_filter}
                  phx_click={@on_toggle_filter}
                >
                  <:choice
                    :for={choice <- filter.choices}
                    label={choice.label}
                    value={choice.value}
                    selected={choice.selected}
                  />
                </.choice_list>
              </:filter>
            </.filter_pill>
            <div
              :if={@show_add_button}
              class={
                if length(@pinned_filters) > 0,
                  do: "Polaris-Filters__AddFilter",
                  else: "Polaris-Filters__AddFilterActivatorMultiple"
              }
            >
              <.popover id={"Fliters" <> @id}>
                <:activator :let={activator}>
                  <div>
                    <.unstyled_button
                      type="button"
                      class="Polaris-Filters__AddFilter"
                      phx_click={activator.phx_click}
                      aria-label="add filter"
                    >
                      <.text as="span" variant="bodySm">
                        Add Filter
                      </.text>
                      <.icon><Icons.plus /></.icon>
                    </.unstyled_button>
                  </div>
                </:activator>
                <:action content="Unimplemented" />
              </.popover>
            </div>
            <div
              :if={length(@selected_filters) > 0}
              class="Polaris-Filters__ClearAll Polaris-Filters__MultiplePinnedFilterClearAll"
            >
              <.button size="micro" phx_click={@on_clear_all} variant="monochromePlain">
                Clear all
              </.button>
            </div>
          </div>
        </div>
        <.box
          :if={@hide_query_field}
          padding_inline_end={[xs: "300"]}
          padding_block_start={[xs: "300"]}
          padding_block_end={[xs: "300"]}
        >
          <.inline_stack align="start" block_align="center" gap={[xs: "400", md: "300"]}>
            {render_slot(@inner_block)}
          </.inline_stack>
        </.box>
      </div>
    </div>
    """
  end

  defp has_active_choice(filter), do: Enum.any?(filter.choices, & &1.selected)

  attr :id, :string, default: nil
  attr :query_form, Phoenix.HTML.Form, default: nil
  attr :phx_submit, :any, default: nil
  attr :phx_change, :any, default: nil
  attr :phx_focus, :any, default: nil
  attr :phx_blur, :any, default: nil
  attr :on_clear, :any, default: nil
  attr :focused, :boolean, default: false
  attr :placeholder, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :borderless_query_field, :boolean, default: false
  attr :loading, :boolean, default: false, doc: "Show a loading spinner to the right of the input"

  slot :inner_block

  def query_field(assigns) do
    assigns =
      assigns
      |> assign(:phx_debounce, "200")
      |> assign_phx_bindings([:phx_submit, :phx_change, :phx_debounce, :phx_throttle])

    ~H"""
    <div class="Polaris-Filters__Container">
      <.box padding={[xs: "200"]}>
        <.inline_stack align="start" block_align="center" gap={[xs: "400", md: "300"]}>
          <div class="Polaris-Filters__SearchField">
            <.text_field
              id={@id}
              phx_focus={@phx_focus}
              phx_blur={@phx_blur || @phx_submit}
              phx_debounce={@phx_debounce}
              on_clear_button_click={@on_clear}
              field={@query_form[:value]}
              placeholder={@placeholder}
              focused={@focused}
              disabled={@disabled}
              auto_complete="off"
              variant={if @borderless_query_field, do: "borderless", else: "inherit"}
              size="slim"
              prefix={search_icon()}
              label={@placeholder}
              label_hidden={true}
              clear_button={true}
              loading={@loading}
            />
          </div>
          {render_slot(@inner_block)}
        </.inline_stack>
      </.box>
    </div>
    """
  end

  defp search_icon(assigns \\ %{}), do: ~H"<.icon><Icons.search /></.icon>"

  attr :id, :string, required: true

  attr :label, :string, required: true

  attr :unsaved_changes, :boolean,
    default: false,
    doc: "Whether the filter is newly applied or updated and hasnt been saved"

  attr :filter_key, :string, required: true, doc: "A unique identifier for the filter"

  attr :selected, :boolean, default: false, doc: "Whether the filter is selected or not"

  attr :initial_active, :boolean,
    default: false,
    doc: "Whether the Popover will be initially open or not"

  attr :hide_clear_button, :boolean, default: false

  attr :disabled, :boolean, default: false, doc: "Whether filtering is disabled"

  # attr :disclosure_z_index_override?: number, doc: "Override z-index of popovers and tooltips"

  attr :close_on_child_overlay_click, :boolean,
    doc: "Whether the filter should close when clicking inside another Popover."

  attr :on_remove, :any, default: nil, doc: "Callback invoked when the filter is removed"

  # attr :on_click?(key: string): void, doc: "Callback invoked when the filter is clicked"

  slot :filter

  def filter_pill(assigns) do
    assigns =
      assigns
      |> assign(:activator_class, build_filter_pill_activator_class(assigns))
      |> assign_default_nil([
        :handle_popover_close,
        :disclosure_z_index_override,
        :close_on_child_overlay_click,
        :filter_key,
        :handle_clear
      ])

    ~H"""
    <div>
      <.popover
        active={@initial_active}
        id={@id <> to_string(@filter_key)}
        on_close={@handle_popover_close}
        z_index_override={@disclosure_z_index_override}
        prevent_close_on_child_overlay_click={!@close_on_child_overlay_click}
      >
        <:activator :let={activator}>
          <div class={["Polaris-Filters-FilterPill__FilterButton", @activator_class]}>
            <.inline_stack gap={[xs: "0"]} wrap={false}>
              <.unstyled_button
                data-polaris="UnstyledButton"
                phx_focus={activator[:set_focused_true]}
                phx_blur={activator[:set_focused_false]}
                phx_click={activator[:phx_click]}
                class="Polaris-Filters-FilterPill__PlainButton Polaris-Filters-FilterPill__ToggleButton"
                type="button"
              >
                <.inline_stack wrap={false} align="center" block_align="center" gap={[xs: "0"]}>
                  <.box :if={@unsaved_changes} padding_inline_end={[xs: "150"]}>
                    <.box
                      background="bg-fill-emphasis"
                      border_radius="050"
                      width="6px"
                      min_height="6px"
                    >
                    </.box>
                  </.box>
                  <.box padding_inline_start={if @unsaved_changes, do: [xs: "0"], else: [xs: "050"]}>
                    <.inline_stack>
                      <.text variant="bodySm" as="span">
                        {@label}
                      </.text>
                    </.inline_stack>
                  </.box>
                  <div class="Polaris-Filters-FilterPill__IconWrapper">
                    <.icon tone="base"><Icons.chevron_down /></.icon>
                  </div>
                </.inline_stack>
              </.unstyled_button>
              <.unstyled_button
                :if={@selected && !@hide_clear_button}
                data-polaris="UnstyledButton"
                phx_click={@handle_clear}
                class="Polaris-Filters-FilterPill__PlainButton Polaris-Filters-FilterPill--clearButton"
                type="button"
                aria-label="clear"
              >
                <div class="Polaris-Filters-FilterPill__IconWrapper">
                  <.icon tone="base"><Icons.x_small /></.icon>
                </div>
              </.unstyled_button>
            </.inline_stack>
          </div>
        </:activator>
        <div class="Polaris-Filters-FilterPill__PopoverWrapper">
          <div data-polaris="Popover.Section" class="Polaris-Popover__Section">
            <.box
              padding_inline_start={[xs: "300"]}
              padding_inline_end={[xs: "300"]}
              padding_block_start={[xs: "200"]}
              padding_block_end={[xs: "150"]}
            >
              <.block_stack gap={[xs: "100"]}>
                {render_slot(@filter)}
                <div :if={!@hide_clear_button} class="Polaris-Filters-FilterPill__ClearButtonWrapper">
                  <.button
                    phx_click={@handle_clear}
                    variant="plain"
                    disabled={!@selected}
                    text_align="left"
                  >
                    clear
                  </.button>
                </div>
              </.block_stack>
            </.box>
          </div>
        </div>
      </.popover>
    </div>
    """
  end

  def build_filter_pill_activator_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&filter_pill_activator_class/1) |> Enum.join(" ")

  defp filter_pill_activator_class({:selected, true}),
    do: ["Polaris-Filters-FilterPill__ActiveFilterButton"]

  defp filter_pill_activator_class({:popover_active, true}),
    do: ["Polaris-Filters-FilterPill__FocusFilterButton"]

  defp filter_pill_activator_class({:focused, true}),
    do: ["Polaris-Filters-FilterPill__focusedFilterButton"]

  defp filter_pill_activator_class({_key, _value}), do: []
end
