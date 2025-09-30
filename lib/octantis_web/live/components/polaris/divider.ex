defmodule OctantisWeb.Components.Polaris.Divider do
  @moduledoc """
  Use to separate or group content.

  ## Examples
  ```elixir
  <.divider />
  ```

  ## See
   - https://polaris.shopify.com/components/layout-and-structure/divider
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Divider/Divider.tsx
  """

  use OctantisWeb.Core

  @doc @moduledoc

  @color_border_alias [
    "border-brand",
    "border-caution",
    "border-critical-secondary",
    "border-critical",
    "border-disabled",
    "border-emphasis-active",
    "border-emphasis-hover",
    "border-emphasis",
    "border-focus",
    "border-hover",
    "border-info",
    "border-inverse-active",
    "border-inverse-hover",
    "border-inverse",
    "border-magic-secondary",
    "border-magic-secondary-hover",
    "border-magic",
    "border-secondary",
    "border-success",
    "border-tertiary",
    "border-warning",
    "border",
    "input-border-active",
    "input-border-hover",
    "input-border",
    "tooltip-tail-down-border",
    "tooltip-tail-up-border",
    "transparent"
  ]

  @border_width_scale ["0", "0165", "025", "050", "100"]

  attr :border_color, :string,
    default: "border-secondary",
    values: @color_border_alias,
    doc: "Divider border color"

  attr :border_width, :string,
    default: "025",
    values: @border_width_scale,
    doc: "Divider border width"

  def divider(assigns) do
    assigns =
      assigns |> assign(:style, style(assigns))

    ~H"""
    <hr class="Polaris-Divider" style={["border-block-start-style: solid;", @style]} />
    """
  end

  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style/1) |> Enum.join(";")

  def build_style({:border_width, value}),
    do: ["border-block-start-width:var(--p-border-width-#{value})"]

  def build_style({:border_color, "transparent"}), do: ["border-block-start-color:transparent"]

  def build_style({:border_color, value}),
    do: ["border-block-start-color:var(--p-color-#{value})"]

  def build_style({_key, _value}), do: []
end
