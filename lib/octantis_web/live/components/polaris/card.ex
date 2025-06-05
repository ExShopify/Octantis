defmodule OctantisWeb.Components.Polaris.Card do
  @moduledoc """
  Cards are used to group similar concepts and tasks together for merchants to scan, read, and get things done. It displays content in a familiar and recognizable style.
  ## Examples
    <.card><.text as="h2">Content inside a card</.text></.card>
    <.card rounded_above="sm" background="bg-surface-secondary" padding="400"><.text as="h2">Content inside a card</.text></.card>
  See
   - https://polaris.shopify.com/components/layout-and-structure/card
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Card/tests/Card.test.tsx
  """

  use OctantisWeb.Core

  import OctantisWeb.Components.Polaris.Box
  import OctantisWeb.Components.Polaris.ShadowBevel

  alias OctantisWeb.Components.Polaris.Tokens.Colour

  @doc @moduledoc

  attr :background, :string, values: Colour.tokens(), default: "bg-surface"

  attr :border_radius, :list, doc: "Border Radius passed to the ShadowBevel"

  attr :padding, :list,
    default: [xs: "400"],
    doc: "A tuple with the size and Space token",
    examples: [[xs: "400", lg: "500"]]

  attr :class, :any, default: "", doc: "A class name to be added to the component class name"

  attr :rounded_above, :string,
    values: ["xs", "sm", "md", "lg", "xl"],
    doc: "Border radius value above a set breakpoint."

  attr_extra_styles()

  attr :rest, :global

  slot :shadow_bevel, doc: "Attributes to be sent to the ShadowBevel component"
  slot :inner_block, required: true

  def card(assigns) do
    assigns =
      assigns
      |> assign(:border_radius, border_radius(assigns))
      |> assign(:style, extra_styles(assigns))

    ~H"""
    <.shadow_bevel
      box_shadow={[xs: "100"]}
      border_radius={@border_radius}
      z_index="32"
      class={@class}
      {slot_attributes(@shadow_bevel)}
    >
      <.box
        background={@background}
        padding={@padding}
        overflow_x="hidden"
        overflow_y="hidden"
        min_height="100%"
        class={@class}
        style={@style}
        {@rest}
      >
        {render_slot(@inner_block)}
      </.box>
    </.shadow_bevel>
    """
  end

  @doc """
  Builds the border radius to pass to ShadowBevel.
  """
  def border_radius(%{border_radius: border_radius}),
    do: border_radius

  def border_radius(%{rounded_above: responsive}),
    do: [{:xs, "0"}, {String.to_atom(responsive), "300"}]

  def border_radius(_), do: [{:xs, "300"}]
end
