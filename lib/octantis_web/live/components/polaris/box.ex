defmodule OctantisWeb.Components.Polaris.Box do
  @moduledoc """
  Box is the most primitive layout component.

  ## Examples
  ```elixir
    <.box border_color="border" border_width="4">Content</.box>
    <.box background="bg-magic-hover" border_radius="full" padding={[xs: "400"]} width="586px">Content</.box>
  ```
  ## See
    - https://polaris.shopify.com/components/layout-and-structure/box
    - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Box/Box.tsx
  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.Polaris.Tokens.Border
  alias OctantisWeb.Components.Polaris.Tokens.Colour
  alias OctantisWeb.Components.Polaris.Tokens.Shaddow
  alias OctantisWeb.Components.Polaris.Tokens.Space

  @doc @moduledoc

  attr :as, :string,
    default: "div",
    doc: "HTML Element type",
    values: ["div", "span", "section", "legend", "ul", "li"]

  attr :background, :string, values: Colour.tokens()
  attr :border_color, :string, values: Colour.tokens()
  attr :border_style, :string, values: ["solid", "dashed", nil]
  attr :border_radius, :string, values: Border.radious_tokens()
  attr :border_radius_end_start, :string, values: Border.radious_tokens()
  attr :border_radius_end_end, :string, values: Border.radious_tokens()
  attr :border_radius_start_start, :string, values: Border.radious_tokens()
  attr :border_radius_start_end, :string, values: Border.radious_tokens()
  attr :border_start_start_radius, :string, values: Border.radious_tokens()
  attr :border_start_end_radius, :string, values: Border.radious_tokens()
  attr :border_end_start_radius, :string, values: Border.radious_tokens()
  attr :border_end_end_radius, :string, values: Border.tokens()
  attr :border_width, :string, values: Border.width_tokens()
  attr :border_block_start_width, :string, values: Border.width_tokens()
  attr :border_block_end_width, :string, values: Border.width_tokens()
  attr :border_inline_start_width, :string, values: Border.width_tokens()
  attr :border_inline_end_width, :string, values: Border.width_tokens()
  attr :color, :string, values: Colour.tokens()

  attr :min_height, :string
  attr :min_width, :string
  attr :max_width, :string
  attr :overflow_x, :string
  attr :overflow_y, :string

  attr :padding, :list,
    doc: "A tuple with the size and Space token",
    examples: [[xs: "400", lg: "500"]]

  attr :padding_block_start, :list,
    doc: "A tuple with the size and Space token",
    examples: [[xs: "400", lg: "500"]]

  attr :padding_block_end, :list,
    doc: "A tuple with the size and Space token",
    examples: [[xs: "400", lg: "500"]]

  attr :padding_inline_start, :list,
    doc: "A tuple with the size and Space token",
    examples: [[xs: "400", lg: "500"]]

  attr :padding_inline_end, :list,
    doc: "A tuple with the size and Space token",
    examples: [[xs: "400", lg: "500"]]

  attr :shadow, :string, values: Shaddow.tokens()
  attr :width, :string
  attr :position, :string

  attr :inset_block_start, :string, values: Space.tokens()
  attr :inset_block_end, :string, values: Space.tokens()
  attr :inset_inline_start, :string, values: Space.tokens()
  attr :inset_inline_end, :string, values: Space.tokens()

  attr :opacity, :string

  attr :outline_color, :string, values: Colour.tokens()
  attr :outline_style, :string
  attr :outline_width, :string, values: Border.width_tokens()

  attr :print_hidden, :boolean, doc: "Visually hide the contents during print"

  attr :visually_hidden, :boolean,
    doc: "Visually hide the contents (still announced by screenreader)"

  attr :class, :any, default: "", doc: "A class name to be added to the component class name"

  attr_extra_styles(except: [:min_height, :opacity])

  attr :rest, :global

  slot :inner_block, required: true

  def box(assigns) do
    assigns =
      assigns
      |> assign(:class, [assigns.class, class(assigns)])
      |> assign(:style, assigns |> style() |> extra_styles(assigns))

    ~H"""
    <.as element={@as} class={["Polaris-Box", @class]} style={@style} {@rest}>
      {render_slot(@inner_block)}
    </.as>
    """
  end

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

  def as(%{element: "section"} = assigns),
    do: ~H"<section {@rest}>{render_slot(@inner_block)}</section>"

  def as(%{element: "legend"} = assigns),
    do: ~H"<legend {@rest}>{render_slot(@inner_block)}</legend>"

  def as(%{element: "ul"} = assigns),
    do: ~H"<ul {@rest}>{render_slot(@inner_block)}</ul>"

  def as(%{element: "li"} = assigns),
    do: ~H"<li {@rest}>{render_slot(@inner_block)}</li>"

  @doc "Build Style elements"
  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style(&1, attrs)) |> Enum.join(";")

  defp build_style({:background, value}, _attrs),
    do: to_style(:background, value, &Colour.var/1)

  defp build_style({:border_color, value}, _attrs),
    do: to_style(:border_color, value, &Colour.var/1)

  defp build_style({:border_style, value}, _attrs), do: to_style(:border_style, value)

  defp build_style({:border_radius, value}, _attrs),
    do: to_style(:border_radius, value, &Border.radius/1)

  defp build_style({:border_radius_end_start, value}, _attrs),
    do: to_style(:border_radius_end_start, value, &Border.var/1)

  defp build_style({:border_radius_end_end, value}, _attrs),
    do: to_style(:border_radius_end_end, value, &Border.var/1)

  defp build_style({:border_radius_start_start, value}, _attrs),
    do: to_style(:border_radius_start_start, value, &Border.var/1)

  defp build_style({:border_radius_start_end, value}, _attrs),
    do: to_style(:border_radius_start_end, value, &Border.var/1)

  defp build_style({:border_start_start_radius, value}, _attrs),
    do: to_style(:border_start_start_radius, value, &Border.radius/1)

  defp build_style({:border_start_end_radius, value}, _attrs),
    do: to_style(:border_start_end_radius, value, &Border.radius/1)

  defp build_style({:border_end_start_radius, value}, _attrs),
    do: to_style(:border_end_start_radius, value, &Border.radius/1)

  defp build_style({:border_end_end_radius, value}, _attrs),
    do: to_style(:border_end_end_radius, value, &Border.radius/1)

  defp build_style({:border_width, value}, attrs) do
    to_style(:border_width, value, &Border.width/1) ++
      require_style(:border_style, "solid", attrs, &build_style/2)
  end

  defp build_style({:border_block_start_width, value}, attrs) do
    to_style(:border_block_start_width, value, &Border.width/1) ++
      require_style(:border_style, "solid", attrs, &build_style/2)
  end

  defp build_style({:border_block_end_width, value}, attrs) do
    to_style(:border_block_end_width, value, &Border.width/1) ++
      require_style(:border_style, "solid", attrs, &build_style/2)
  end

  defp build_style({:border_inline_start_width, value}, attrs) do
    to_style(:border_inline_start_width, value, &Border.width/1) ++
      require_style(:border_style, "solid", attrs, &build_style/2)
  end

  defp build_style({:border_inline_end_width, value}, attrs) do
    to_style(:border_inline_end_width, value, &Border.width/1) ++
      require_style(:border_style, "solid", attrs, &build_style/2)
  end

  defp build_style({:color, value}, _attrs), do: to_style(:color, value, &Colour.var/1)
  defp build_style({:min_height, value}, _attrs), do: to_style(:min_height, value)
  defp build_style({:min_width, value}, _attrs), do: to_style(:min_width, value)
  defp build_style({:max_width, value}, _attrs), do: to_style(:max_width, value)
  defp build_style({:overflow_x, value}, _attrs), do: to_style(:overflow_x, value)
  defp build_style({:overflow_y, value}, _attrs), do: to_style(:overflow_y, value)

  defp build_style({:padding_block_start, values}, _attrs),
    do: to_responsive_style(:padding_block_start, values, &Space.var/1)

  defp build_style({:padding_block_end, values}, _attrs),
    do: to_responsive_style(:padding_block_end, values, &Space.var/1)

  defp build_style({:padding_inline_start, values}, _attrs),
    do: to_responsive_style(:padding_inline_start, values, &Space.var/1)

  defp build_style({:padding_inline_end, value}, _attrs),
    do: to_responsive_style(:padding_inline_end, value, &Space.var/1)

  defp build_style({:padding, value}, attrs) do
    to_responsive_style(:padding, value, &Space.var/1) ++
      require_style(:padding_block_start, attrs[:padding], attrs, &build_style/2) ++
      require_style(:padding_block_end, attrs[:padding], attrs, &build_style/2) ++
      require_style(:padding_inline_start, attrs[:padding], attrs, &build_style/2) ++
      require_style(:padding_inline_end, attrs[:padding], attrs, &build_style/2)
  end

  defp build_style({:shadow, value}, _attrs), do: to_style(:shadow, value, &Shaddow.var/1)
  defp build_style({:width, value}, _attrs), do: to_style(:width, value)
  defp build_style({:position, value}, _attrs), do: to_style(:position, value)

  defp build_style({:inset_block_start, value}, _attrs),
    do: to_style(:inset_block_start, value, &Space.var/1)

  defp build_style({:inset_block_end, value}, _attrs),
    do: to_style(:inset_block_end, value, &Space.var/1)

  defp build_style({:inset_inline_start, value}, _attrs),
    do: to_style(:inset_inline_start, value, &Space.var/1)

  defp build_style({:inset_inline_end, value}, _attrs),
    do: to_style(:inset_inline_end, value, &Space.var/1)

  defp build_style({:opacity, value}, _attrs), do: to_style(:opacity, value)

  defp build_style({:outline_color, value}, _attrs),
    do: to_style(:outline_color, value, &Colour.var/1)

  defp build_style({:outline_style, value}, _attrs), do: to_style(:outline_style, value)

  defp build_style({:outline_width, value}, _attrs),
    do: to_style(:outline_width, value, &Border.width/1)

  defp build_style({_key, _value}, _attrs), do: []

  @doc "Build Class elements"
  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class(&1, attrs)) |> Enum.join(" ")

  defp build_class({:print_hidden, true}, _attrs), do: to_class(:print_hidden)
  defp build_class({:visually_hidden, true}, _attrs), do: to_class(:visually_hidden)

  defp build_class({:as, "ul"}, _attrs), do: to_class("listReset")
  defp build_class({_key, _value}, _attrs), do: []
end
