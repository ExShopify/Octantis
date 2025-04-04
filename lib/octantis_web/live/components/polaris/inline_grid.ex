defmodule OctantisWeb.Components.Polaris.InlineGrid do
  @moduledoc """

  Use to lay out children horizontally with equal gap between columns. Based on CSS Grid.

  ## Examples
  ```elixir
    <.inline_grid gap={[xs: 1, md: "2fr 1fr"]}>
      <div>Contents</div>
      <div>Contents</div>
    </.inline_grid>
  ```

  See
   - https://polaris.shopify.com/components/layout-and-structure/inline-grid
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/InlineGrid/InlineGrid.tsx

  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.Polaris.Tokens.Space

  @doc @moduledoc

  attr :gap, :list,
    doc:
      "The spacing between children. Accepts a spacing token or an object of spacing tokens for different screen sizes.",
    examples: [[xs: "200"], [xs: "100", sm: "200", md: "300", lg: "400", xl: "500"]]

  attr :columns, :list,
    doc:
      "The number of columns to display. Accepts either a single value or an object of values for different screen sizes.",
    examples: [[xs: 2], [xs: 1, sm: 2, md: 3, lg: 4, xl: 6], [xs: 1, md: "2fr 1fr"]]

  attr :align_items, :string,
    values: ["start", "end", "center"],
    doc:
      "Vertical alignment of children. If not set, inline elements will stretch to the height of the parent."

  attr :class, :any, default: "", doc: "A class name to be added to the component class name"

  attr_extra_styles(except: [:align_items])

  slot :inner_block

  def inline_grid(assigns) do
    assigns =
      assigns
      |> assign(:class, [assigns.class, inline_grid_build_class(assigns)])
      |> assign(:style, assigns |> style() |> extra_styles(assigns))

    ~H"""
    <div class={["Polaris-InlineGrid", @class]} style={@style}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  defp inline_grid_build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&inline_grid_class/1) |> Enum.join(" ")

  defp inline_grid_class({_key, _value}), do: []

  @doc "Build Style elements"
  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style(&1, attrs)) |> Enum.join(";")

  defp build_style({:gap, values}, _attrs), do: to_responsive_style(:gap, values, &Space.var/1)

  defp build_style({:columns, values}, _attrs),
    do: to_responsive_style(:grid_template_columns, values, &columns_style_value/1)

  defp build_style({:align_items, value}, _attrs), do: to_style(:align_items, value)

  defp build_style({_key, _value}, _attrs), do: []

  defp columns_style_value(value) when is_number(value), do: "repeat(#{value}, minmax(0, 1fr))"
  defp columns_style_value(value) when is_binary(value), do: value
end
