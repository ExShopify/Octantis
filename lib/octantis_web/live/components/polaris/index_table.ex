defmodule OctantisWeb.Components.Polaris.IndexTable do
  @moduledoc """
  An index table displays a collection of objects of the same type, like orders or products. The main job of an index table is to help merchants get an at-a-glance of the objects to perform actions or navigate to a full-page representation of it.

  ## Examples
  ```elixir
  <.index_table />
  ```

  See
  - https://polaris.shopify.com/components/tables/index-table
  - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/IndexTable/IndexTable.tsx

  """

  use OctantisWeb.Core

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([:checkbox, :complex_action, :inline_stack, :text])

  alias OctantisWeb.Components.Polaris.ComplexAction

  @doc @moduledoc

  attr :id, :string, default: "IndexTable", doc: "A unique identifier for the table"

  attr :selectable, :boolean,
    required: true,
    doc: "Include the selection checkboxes to the left"

  attr :selected, :map, default: %{}, doc: "A map of row ids to 'true' or 'false'"

  attr :rows, :list, required: true, doc: "A list of items, each item must have an id"

  attr :class, :any, default: "", doc: "A class name to be added to the component class name"

  attr :on_selection_change, :any, default: nil, doc: "Callback for when the checkbox is toggled"

  attr_extra_styles()

  slot :col, required: true do
    attr :header, :any,
      examples: ["Order", "Date", "Customer", {"Total", [alignment: "end"]}],
      required: true

    attr :class, :any, doc: "Class to be passed on to the header and cell."
  end

  slot :promoted_bulk_action,
    validate_attrs: true,
    doc: "BulkActions for the table" do
    ComplexAction.attributes()
  end

  slot :inner_block

  def index_table(assigns) do
    selected_count = Enum.count(assigns.selected, fn {_k, v} -> v == "true" end)

    assigns =
      assigns
      |> assign(:selected_count, selected_count)
      |> assign(:count, length(assigns.col))
      |> assign(:style, extra_styles(assigns))
      |> assign_table_class()

    ~H"""
    <div class={["Polaris-IndexTable", @class]} style={@style}>
      <form>
        <div class="Polaris-IndexTable__IndexTableWrapper">
          <div class="Polaris-IndexTable__LoadingPanel"></div>
          <div class="Polaris-IndexTable__StickyTable" role="presentation">
            <div>
              <div></div>
              <div>
                <div class="Polaris-IndexTable__StickyTableHeader"></div>
                <.bulk_action_wrapper
                  id={"BulkActionWrapper" <> @id}
                  selected_count={@selected_count}
                  on_toggle_all={@on_selection_change}
                  selected={@selected}
                >
                  <:promoted_bulk_action
                    :for={promoted_bulk_action <- @promoted_bulk_action}
                    {promoted_bulk_action}
                  />
                </.bulk_action_wrapper>
              </div>
            </div>
          </div>
          <div class="Polaris-IndexTable-ScrollContainer">
            <table class={[
              "Polaris-IndexTable__Table",
              "Polaris-IndexTable__Table--sticky",
              @table_class
            ]}>
              {render_slot(@inner_block)}
              <thead>
                <tr>
                  <.index_table_th_checkbox
                    :if={@selectable}
                    id={@id}
                    selected_count={@selected_count}
                    checked={@selected_count == map_size(@selected) and map_size(@selected) > 0}
                    on_selection_change={@on_selection_change}
                  />
                  <.index_table_th
                    :for={{col, i} <- Enum.with_index(@col)}
                    selectable={@selectable}
                    heading={col[:header]}
                    class={col[:class]}
                    index={i}
                    last={i == @count - 1}
                  />
                </tr>
              </thead>
              <tbody>
                <.index_table_row
                  :for={row <- @rows}
                  selectable={@selectable}
                  checked={@selected[row_id(row)] == "true"}
                >
                  <.index_table_row_checkbox
                    :if={@selectable}
                    id={row_id(row)}
                    parent_id={@id}
                    on_selection_change={@on_selection_change}
                    checked={@selected[row_id(row)] == "true"}
                  />
                  <.index_table_cell
                    :for={col <- @col}
                    class={col[:class]}
                    phx_click={
                      JS.dispatch("click", to: "#" <> checkbox_id(@id, row_id(row)), bubbles: false)
                    }
                  >
                    {render_slot(col, row)}
                  </.index_table_cell>
                </.index_table_row>
              </tbody>
            </table>
          </div>
          <div class="Polaris-IndexTable__ScrollBarContainer Polaris-IndexTable--scrollBarContainerHidden">
          </div>
        </div>
      </form>
    </div>
    """
  end

  def assign_table_class(assigns), do: assigns |> assign(:table_class, table_class(assigns))

  def table_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_table_class/1) |> Enum.join(" ")

  def build_table_class({:selected_count, value}) when value > 0,
    do: ["Polaris-IndexTable--disableTextSelection"]

  def build_table_class({_key, _value}), do: []

  attr :id, :string
  attr :on_selection_change, :any, doc: "Callback for when the checkbox is toggled"
  attr :checked, :boolean, default: false
  attr :selected_count, :integer, required: true, doc: "The number of selected rows"

  def index_table_th_checkbox(assigns) do
    ~H"""
    <th
      class="Polaris-IndexTable__TableHeading Polaris-IndexTable__TableHeading--first"
      data-index-table-heading="true"
    >
      <div class="Polaris-IndexTable__ColumnHeaderCheckboxWrapper">
        <.checkbox
          id={@id}
          name="select_all"
          label="Select all"
          label_hidden={true}
          phx_change={@on_selection_change}
          checked={@checked}
        />
      </div>
    </th>
    """
  end

  attr :heading, :any, required: true
  attr :index, :integer, required: true
  attr :last, :boolean, required: true
  attr :selectable, :boolean, required: true
  attr :class, :any, doc: "Class to be passed on to the header and cel"

  def index_table_th(assigns) do
    label =
      case assigns.heading do
        label when is_binary(label) -> label
        {label, _opts} when is_binary(label) -> label
        nil -> nil
      end

    assigns =
      assigns
      |> assign(:label, label)
      |> assign(:th_class, th_build_class(assigns))

    ~H"""
    <th class={["Polaris-IndexTable__TableHeading", @th_class, @class]}>
      <div style="--pc-index-table-heading-extra-padding-right:0" class="">
        <span :if={@label} class="Polaris-Text--root Polaris-Text--bodySm Polaris-Text--medium">
          {@label}
        </span>
      </div>
    </th>
    """
  end

  def th_build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&th_class/1) |> Enum.join(" ")

  def th_class({:index, 0}), do: ["Polaris-IndexTable__TableHeading--second"]
  def th_class({:selectable, false}), do: ["Polaris-IndexTable__TableHeading--unselectable"]
  def th_class({:last, true}), do: ["Polaris-IndexTable__TableHeading--last"]
  def th_class({_key, _value}), do: []

  attr :id, :string
  attr :parent_id, :string
  attr :on_selection_change, :any, doc: "Callback for when the checkbox is toggled"
  attr :checked, :boolean, default: false

  def index_table_row_checkbox(assigns) do
    ~H"""
    <td class="Polaris-IndexTable__TableCell Polaris-IndexTable__TableCell--first">
      <div class="Polaris-IndexTable-Checkbox__Wrapper">
        <.checkbox
          id={checkbox_id(@parent_id, @id)}
          name={@id}
          checked={@checked}
          label="select"
          label_hidden
          phx_change={@on_selection_change}
        />
      </div>
    </td>
    """
  end

  attr :phx_click, :any, doc: "onClick: Callback when row is clicked"

  attr :checked, :boolean, required: true
  attr :selectable, :boolean, required: true

  slot :inner_block

  def index_table_row(assigns) do
    assigns = assigns |> assign(:class, tr_class(assigns)) |> assign_phx_bindings()

    ~H"""
    <tr class={["Polaris-IndexTable__TableRow", @class]} {@bindings}>
      {render_slot(@inner_block)}
    </tr>
    """
  end

  def tr_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_tr_class/1) |> Enum.join(" ")

  def build_tr_class({:checked, true}), do: ["Polaris-IndexTable__TableRow--selected"]
  def build_tr_class({:selectable, false}), do: ["Polaris-IndexTable__TableRow--unclickable"]
  def build_tr_class({_key, _value}), do: []

  attr :phx_click, :any, doc: "onClick: Callback when row is clicked"
  attr :class, :any, doc: "Class to be passed on to the cell."

  slot :inner_block

  def index_table_cell(assigns) do
    assigns = assigns |> assign_phx_bindings()

    ~H"""
    <td class={["Polaris-IndexTable__TableCell", @class]} {@bindings}>
      {render_slot(@inner_block)}
    </td>
    """
  end

  attr :id, :string, required: true
  attr :on_toggle_all, :any
  attr :selected_count, :integer, required: true
  attr :selected, :map, default: %{}, doc: "A map of row ids to 'true' or 'false'"

  slot :promoted_bulk_action,
    validate_attrs: true,
    doc: "BulkActions for the table" do
    ComplexAction.attributes()
  end

  def bulk_action_wrapper(assigns) do
    assigns =
      assigns
      |> assign(:select_all_label, "#{assigns.selected_count} selected")
      |> assign(:label_hidden, assigns.selected_count == 0)
      |> assign_bulk_action_wrapper_class()

    ~H"""
    <div class={["Polaris-IndexTable__BulkActionsWrapper", @bulk_action_wrapper_class]}>
      <div>
        <.inline_stack block_align="center" gap={[xs: "400"]}>
          <div class="Polaris-BulkActions__BulkActionsSelectAllWrapper">
            <.checkable_button
              id={@id}
              label={if !@label_hidden, do: @select_all_label}
              checked={@selected_count == map_size(@selected)}
              phx_click={@on_toggle_all}
            />
          </div>
          <div class="Polaris-BulkActions__BulkActionsPromotedActionsWrapper">
            <.inline_stack gap={[xs: "100"]} block_align="center">
              <div class="Polaris-BulkActions__BulkActionsOuterLayout">
                <%!-- {measurerMarkup} --%>
                <div class="Polaris-BulkActions__BulkActionsLayout">
                  <div
                    :for={promoted_bulk_action <- @promoted_bulk_action}
                    class="Polaris-BulkActions__BulkActionButton"
                  >
                    <.complex_action {promoted_bulk_action} />
                  </div>
                </div>
              </div>
            </.inline_stack>
          </div>
        </.inline_stack>
      </div>
    </div>
    """
  end

  def assign_bulk_action_wrapper_class(assigns),
    do: assigns |> assign(:bulk_action_wrapper_class, bulk_action_wrapper_class(assigns))

  def bulk_action_wrapper_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_bulk_action_wrapper_class/1) |> Enum.join(" ")

  def build_bulk_action_wrapper_class({:label_hidden, false}),
    do: ["Polaris-IndexTable__BulkActionsWrapperVisible"]

  def build_bulk_action_wrapper_class({_key, _value}), do: []

  attr :id, :string, required: true
  attr :name, :string, default: "select_all"
  attr :accessibility_label, :string, default: nil
  attr :label, :string, default: nil
  attr :checked, :atom, values: [true, false, :indeterminate]
  attr :disabled, :boolean, default: false
  attr :phx_click, :any, doc: "onClick: Callback when row is clicked"
  attr :aria_live, :atom, default: nil, values: [nil, :off, :polite]

  def checkable_button(assigns) do
    assigns = assigns |> assign(:phx_values, select_all: "false") |> assign_phx_bindings()

    ~H"""
    <div class="Polaris-CheckableButton" {@bindings}>
      <div class="Polaris-CheckableButton__Checkbox">
        <.checkbox
          id={@id}
          name={@name}
          label={@accessibility_label}
          label_hidden={true}
          checked={@checked}
          disabled={@disabled}
          phx_change={@phx_click}
        />
      </div>
      <span :if={@label} class="Polaris-CheckableButton__Label" aria-live={@aria_live}>
        <.text as="span" variant="bodySm" font_weight="medium">
          {@label}
        </.text>
      </span>
    </div>
    """
  end

  # Pull the id out of the row
  defp row_id(%{id: id}), do: id
  defp row_id(%{key: key}), do: key
  defp row_id({_data, index}) when is_integer(index), do: to_string(index)

  defp checkbox_id(parent_id, row_id), do: parent_id <> "Checkbox" <> row_id
end
