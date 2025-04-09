defmodule OctantisWeb.Components.Polaris.InlineStack do
  @moduledoc """

  Use to display children horizontally in a row. Based on CSS Flexbox.

  ## Examples
  ```elixir
    <.inline_stack gap={[xs: 500]}>
      <div>Contents</div>
      <div>Contents</div>
    </.inline_stack>
  ```

  See
   - https://polaris.shopify.com/components/layout-and-structure/inline-stack
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/InlineStack/InlineStack.tsx

  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.Polaris.Tokens.Space

  @doc @moduledoc

  attr :id, :string, default: nil

  attr :as, :string,
    values: ["div", "span", "li", "ol", "ul"],
    doc: "HTML Element type",
    default: "div"

  attr :align, :string,
    values: [
      "start",
      "center",
      "end",
      "space-around",
      "space-between",
      "space-evenly"
    ],
    doc: "Horizontal alignment of children"

  attr :direction, :list,
    examples: [[xs: "row"], [xs: "row-reverse"]],
    doc: "Horizontal direction in which children are laid out",
    default: [xs: "row"]

  attr :block_align, :string,
    values: ["start", "center", "end", "baseline", "stretch"],
    doc: "Vertical alignment of children"

  attr :gap, :list,
    examples: [[xs: "200", sm: "300", md: "400", lg: "500", xl: "600"]],
    doc:
      "The spacing between elements. Accepts a spacing token or an object of spacing tokens for different screen sizes."

  attr :wrap, :boolean,
    default: true,
    doc: "Wrap stack elements to additional rows as needed on small screens"

  attr_extra_styles()

  slot :inner_block, required: true

  def inline_stack(assigns) do
    assigns =
      assigns |> assign(:style, style(assigns) |> extra_styles(assigns))

    ~H"""
    <.as id={@id} element={@as} class={["Polaris-InlineStack"]} style={@style}>
      {render_slot(@inner_block)}
    </.as>
    """
  end

  @doc "Build Style elements"
  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style(&1, attrs)) |> Enum.join(";")

  defp build_style({:wrap, false}, _attrs), do: to_style(:wrap, "nowrap")
  defp build_style({:wrap, true}, _attrs), do: to_style(:wrap, "wrap")
  defp build_style({:align, value}, _attrs), do: to_style(:align, value)
  defp build_style({:block_align, value}, _attrs), do: to_style(:block_align, value)
  defp build_style({:direction, value}, _attrs), do: to_responsive_style(:direction, value)
  defp build_style({:gap, value}, _attrs), do: to_responsive_style(:gap, value, &Space.var/1)
  defp build_style({_key, _value}, _attrs), do: []

  @doc """
  A helper for setting the underlaying element of a component
  """

  attr :element, :string,
    values: ["div", "span", "li", "ol", "ul"],
    required: true

  attr :rest, :global

  slot :inner_block, required: true

  def as(%{element: "div"} = assigns),
    do: ~H"<div {@rest}>{render_slot(@inner_block)}</div>"

  def as(%{element: "span"} = assigns),
    do: ~H"<span {@rest}>{render_slot(@inner_block)}</span>"

  def as(%{element: "li"} = assigns),
    do: ~H"<li {@rest}>{render_slot(@inner_block)}</li>"

  def as(%{element: "ol"} = assigns),
    do: ~H"<ol {@rest}>{render_slot(@inner_block)}</ol>"

  def as(%{element: "ul"} = assigns),
    do: ~H"<ul {@rest}>{render_slot(@inner_block)}</ul>"
end
