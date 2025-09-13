defmodule OctantisWeb.Components.Polaris.Grid do
  @moduledoc """
  Create complex layouts based on CSS Grid.

  ## Examples
  ```elixir
  <.grid columns={[sm: 3]}>
    <:grid_cell column_span={[xs: 6, sm: 3, md: 3, lg: 6, xl: 6]}>
      <.card>
        <.text as="h2" variant="bodyMd">View a summary of your online store’s sales.</.text>
      </.card>
    </:grid_cell>
    <:grid_cell column_span={[xs: 6, sm: 3, md: 3, lg: 6, xl: 6]}>
      <.card>
        <.text as="h2" variant="bodyMd">View a summary of your online store’s orders.</.text>
      </.card>
    </:grid_cell>
  </.grid>
  ```

  ## See
   - https://polaris.shopify.com/components/layout-and-structure/grid
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Grid/Grid.tsx
  """

  use OctantisWeb.Core, :component

  @doc @moduledoc

  attr :columns, :list,
    doc: "The number of columns at a breakpoint",
    examples: [[xs: 6, sm: 3, md: 3, lg: 6, xl: 6]]

  attr :areas, :list,
    examples: [[xs: ["product product sidebar", "product product sidebar"]]],
    doc: "grid-areas"

  attr :class, :any, default: "", doc: "A class name to be added to the component class name"

  attr_extra_styles()

  slot :grid_cell, doc: "the slots for grid cells" do
    attr :column_span, :list,
      doc: "The size of each column at a breakpoint",
      examples: [[xs: 6, sm: 3, md: 3, lg: 6, xl: 6]]

    attr :area, :string, doc: "Area name for the grid cell"

    attr_extra_styles()
  end

  def grid(assigns) do
    assigns = assign(assigns, :style, assigns |> style() |> extra_styles(assigns))

    ~H"""
    <div class={["Polaris-Grid", @class]} style={@style}>
      <%= for cell <- @grid_cell do %>
        <.grid_cell {cell}>
          {render_slot(cell)}
        </.grid_cell>
      <% end %>
    </div>
    """
  end

  @doc "Build Style elements"
  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style(&1, attrs)) |> Enum.join(";")

  defp build_style({:columns, value}, _attrs), do: to_responsive_style(:columns, value)
  defp build_style({:gap, value}, _attrs), do: to_responsive_style(:gap, value)
  defp build_style({:areas, value}, _attrs), do: to_responsive_style(:areas, value, &join_areas/1)

  defp build_style({_key, _value}, _attrs), do: []

  defp join_areas(areas),
    do: areas |> List.wrap() |> Enum.map_join(" ", &("'" <> &1 <> "'"))

  @doc """

  See
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Grid/components/Cell/Cell.tsx
  """

  attr :area, :string, doc: "Area name for the grid cell"

  attr :column_span, :list,
    doc: "The number of columns a cell spans at each breakpoint",
    examples: [[xs: 6, sm: 3, md: 3, lg: 6, xl: 6]]

  slot :inner_block, required: true

  attr_extra_styles()

  def grid_cell(assigns) do
    assigns =
      assigns
      |> assign(:class, grid_cell_class(assigns))
      |> assign(:style, assigns |> cell_style() |> extra_styles(assigns))

    ~H"""
    <div class={["Polaris-Grid-Cell", @class]} style={@style}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  defp grid_cell_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&grid_cell_build_class/1) |> Enum.join(" ")

  def grid_cell_build_class({:column_span, column_spans}) when is_list(column_spans),
    do: Enum.map(column_spans, &column_span_class/1)

  def grid_cell_build_class({_key, _value}), do: []

  def column_span_class({breakpoint, size}),
    do: ["Polaris-Grid-Cell--cell_#{size}Column#{camelize_breakpoint(breakpoint)}"]

  @doc "Build Style elements"
  def cell_style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_cell_style(&1, attrs)) |> Enum.join(";")

  defp build_cell_style({:column, columns}, _attrs), do: Enum.map(columns, &column_style/1)
  defp build_cell_style({:row, rows}, _attrs), do: Enum.map(rows, &column_style/1)
  defp build_cell_style({:area, area}, _attrs), do: ["grid-area:#{area}"]
  defp build_cell_style({_key, _value}, _attrs), do: []

  def column_style({breakpoint, size}) when breakpoint in @breakpoints,
    do: "--pc-column-#{breakpoint}: #{size};"

  def row_style({breakpoint, size}) when breakpoint in @breakpoints,
    do: "--pc-row-#{breakpoint}: #{size};"

  def camelize_breakpoint(breakpoint) when breakpoint in @breakpoints,
    do: breakpoint |> Atom.to_string() |> Macro.camelize()
end
