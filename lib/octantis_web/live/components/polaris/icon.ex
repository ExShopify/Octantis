defmodule OctantisWeb.Components.Polaris.Icon do
  @moduledoc """
  Icons are used to visually communicate core parts of the product and available actions. They can act as wayfinding tools to help merchants more easily understand where they are in the product, and common interaction patterns that are available.

  ## Examples
  ```elixir
  <.icon>
    <Icons.adjust />
  </.icon>
  ```
  ## See
    - https://polaris.shopify.com/components/images-and-icons/icon?example=icon-default
    - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Badge/Badge.tsx
    - https://polaris.shopify.com/icons
  """
  use OctantisWeb.Core

  import OctantisWeb.Components.Polaris.Text, only: [text: 1]

  @doc @moduledoc

  @tone_values [
    "base",
    "inherit",
    "subdued",
    "caution",
    "warning",
    "critical",
    "interactive",
    "info",
    "success",
    "primary",
    "emphasis",
    "magic",
    "textCaution",
    "textWarning",
    "textCritical",
    "textInfo",
    "textSuccess",
    "textPrimary",
    "textMagic"
  ]

  attr :tone, :string, values: @tone_values

  attr :accessibility_label, :string

  slot :inner_block, required: true

  def icon(assigns) do
    assigns =
      assigns
      |> assign(:class, class(assigns))
      |> assign_new(:accessibility_label, fn -> nil end)

    ~H"""
    <span class={["Polaris-Icon", @class]}>
      <.text :if={@accessibility_label} as="span" visually_hidden>
        {@accessibility_label}
      </.text>
      {render_slot(@inner_block)}
    </span>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  def build_class({:tone, value}), do: to_class("tone#{Macro.camelize(value)}")
  def build_class({_key, _value}), do: []

  def tone_values, do: @tone_values
end
