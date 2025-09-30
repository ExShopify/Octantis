defmodule OctantisWeb.Components.Polaris.ShadowBevel do
  @moduledoc """
  A building block for other components such as Card

  ## See
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/ShadowBevel/ShadowBevel.tsx
  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.Polaris.Tokens.Border
  alias OctantisWeb.Components.Polaris.Tokens.Shaddow

  attr :box_shadow, :list, doc: "The box-shadow applied to the root element."

  attr :border_radius, :list,
    doc: "The border-radius applied to both the root and pseudo elements."

  attr :z_index, :string,
    values: ["0", "32"],
    default: "0",
    doc: "The z-index applied to the pseudo element."

  attr :bevel, :boolean,
    default: true,
    values: [true],
    doc:
      "Enable/disable the bevel effect. Note: This also disables the border-radius and box-shadow."

  attr :class, :any, default: "", doc: "A class name to be added to the component class name"

  attr_extra_styles()

  slot :inner_block, required: true

  def shadow_bevel(assigns) do
    assigns = assign(assigns, :style, assigns |> style() |> extra_styles(assigns))

    ~H"""
    <div
      class={["Polaris-ShadowBevel", @class]}
      style={["--pc-shadow-bevel-content-xs:\"\";", @style]}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc "Build Style elements"
  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style(&1, attrs)) |> Enum.join(";")

  defp build_style({:box_shadow, value}, _attrs),
    do: to_responsive_style(:box_shadow, value, &Shaddow.var/1)

  defp build_style({:border_radius, value}, _attrs),
    do: to_responsive_style(:border_radius, value, &Border.radius/1)

  defp build_style({:z_index, value}, _attrs), do: to_style(:z_index, value)

  defp build_style({_key, _value}, _attrs), do: []
end
