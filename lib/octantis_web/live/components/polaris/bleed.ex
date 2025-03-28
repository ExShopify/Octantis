defmodule OctantisWeb.Components.Polaris.Bleed do
  @moduledoc """
  Applies negative margin to allow content to bleed out into the surrounding layout.

  ## Examples
    ```elixir
    </.bleed>
    ```

  See
   - https://polaris.shopify.com/components/layout-and-structure/bleed
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Bleed/Bleed.tsx
  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.Polaris.Tokens.Space

  @doc @moduledoc

  attr :margin_inline, :list,
    examples: [[xs: "500"]],
    doc: "Negative horizontal space around children"

  attr :margin_block, :list,
    examples: [[xs: "500"]],
    doc: "Negative vertical space around children"

  attr :margin_block_start, :list,
    examples: [[xs: "500"]],
    doc: "Negative top space around children"

  attr :margin_block_end, :list,
    examples: [[xs: "500"]],
    doc: "Negative bottom space around children"

  attr :margin_inline_start, :list,
    examples: [[xs: "500"]],
    doc: "Negative left space around children"

  attr :margin_inline_end, :list,
    examples: [[xs: "500"]],
    doc: "Negative right space around children"

  attr_extra_styles()

  slot :inner_block

  def bleed(assigns) do
    assigns =
      assigns
      |> assign(:style, assigns |> style() |> extra_styles(assigns))

    ~H"""
    <div class="Polaris-Bleed" style={@style}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc "Build Style elements"
  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style(&1, attrs)) |> Enum.join(";")

  defp build_style({:margin_block, value}, attrs) do
    require_style(:margin_block_start, value, attrs, &build_style/2) ++
      require_style(:margin_inline_end, value, attrs, &build_style/2)
  end

  defp build_style({:margin_inline, value}, attrs) do
    require_style(:padding_block_start, value, attrs, &build_style/2) ++
      require_style(:margin_inline_end, value, attrs, &build_style/2)
  end

  defp build_style({:margin_inline_start, value}, _attrs),
    do: to_style(:margin_inline_start, value, &Space.var/1)

  defp build_style({:margin_inline_end, value}, _attrs),
    do: to_style(:margin_inline_end, value, &Space.var/1)

  defp build_style({:margin_block_start, value}, _attrs),
    do: to_style(:margin_block_start, value, &Space.var/1)

  defp build_style({:margin_block_end, value}, _attrs),
    do: to_style(:margin_block_end, value, &Space.var/1)

  defp build_style({_key, _value}, _attrs), do: []
end
