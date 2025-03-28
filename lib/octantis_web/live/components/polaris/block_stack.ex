defmodule OctantisWeb.Components.Polaris.BlockStack do
  @moduledoc """
  Use to display children vertically and horizontally with full width by default. Based on CSS Flexbox.

  ## Examples

    ```elixir
      <.block_stack gap={[xs: 500]}>
        <div>Contents</div>
        <div>Contents</div>
      </.block_stack>
    ```

  See
   - https://polaris.shopify.com/components/layout-and-structure/block-stack
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/BlockStack/BlockStack.tsx
  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.Polaris.Tokens.Space

  @doc @moduledoc

  attr :as, :string,
    default: "div",
    doc: "HTML Element type",
    values: ["div", "span", "ul", "ol", "li", "fieldset"]

  attr :align, :string,
    doc: "Vertical alignment of children",
    values: ["start", "center", "end", "space-around", "space-between", "space-evenly"]

  attr :inline_align, :string,
    doc: "Horizontal alignment of children",
    values: ["start", "center", "end", "baseline", "stretch"]

  attr :gap, :list,
    doc: "The spacing between children",
    examples: [[xs: "500", sm: "400", md: "200"]]

  attr :reverse_order, :boolean, default: false, doc: "Reverse the render order of child items"

  attr_extra_styles()

  attr :rest, :global

  slot :inner_block, required: true

  def block_stack(assigns) do
    assigns =
      assigns
      |> assign(:class, build_class(assigns))
      |> assign(:style, assigns |> style() |> extra_styles(assigns))

    ~H"""
    <.as element={@as} class={["Polaris-BlockStack", @class]} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </.as>
    """
  end

  defp build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&class/1) |> Enum.join(" ")

  defp class({:as, "ul"}), do: ["Polaris-BlockStack--listReset"]
  defp class({:as, "ol"}), do: ["Polaris-BlockStack--listReset"]
  defp class({:as, "fieldset"}), do: ["Polaris-BlockStack--fieldsetReset"]
  defp class({_key, _value}), do: []

  @doc "Build Style elements"
  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style(&1, attrs)) |> Enum.join(";")

  defp build_style({:reverse_order, false}, _attrs), do: to_style(:order, "column")
  defp build_style({:reverse_order, true}, _attrs), do: to_style(:order, "column-reverse")
  defp build_style({:inline_align, value}, _attrs), do: to_style(:inline_align, value)
  defp build_style({:align, value}, _attrs), do: to_style(:align, value)
  defp build_style({:gap, value}, _attrs), do: to_responsive_style(:gap, value, &Space.var/1)
  defp build_style({_key, _value}, _attrs), do: []

  @doc """
  As
  A helper for setting the underlaying element of a component
  """
  attr :element, :string,
    values: ["div", "span", "ul", "ol", "li", "fieldset"],
    required: true

  attr :rest, :global

  slot :inner_block, required: true

  def as(%{element: "div"} = assigns),
    do: ~H"<div {@rest}>{render_slot(@inner_block)}</div>"

  def as(%{element: "span"} = assigns),
    do: ~H"<span {@rest}>{render_slot(@inner_block)}</span>"

  def as(%{element: "ul"} = assigns),
    do: ~H"<ul {@rest}>{render_slot(@inner_block)}</ul>"

  def as(%{element: "ol"} = assigns),
    do: ~H"<ol {@rest}>{render_slot(@inner_block)}</ol>"

  def as(%{element: "li"} = assigns),
    do: ~H"<li {@rest}>{render_slot(@inner_block)}</li>"

  def as(%{element: "fieldset"} = assigns),
    do: ~H"<fieldset {@rest}>{render_slot(@inner_block)}</fieldset>"
end
