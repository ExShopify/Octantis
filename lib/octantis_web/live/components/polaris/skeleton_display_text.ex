defmodule OctantisWeb.Components.Polaris.SkeletonDisplayText do
  @moduledoc """
  Skeleton display text is used to provide a low fidelity representation of content before it appears on the page, and improves load times perceived by merchants. Can be used for content in or outside of a card.

  ## Examples
  ```elixir
  </.skeleton_display_text>
  ```

  ## See
   - https://polaris.shopify.com/components/feedback-indicators/skeleton-display-text
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/SkeletonDisplayText/SkeletonDisplayText.tsx
  """

  use OctantisWeb.Core, :component

  @doc @moduledoc

  attr :size, :string, default: "medium", values: ["small", "medium", "large", "extraLarge"]

  attr :max_width, :string, examples: ["{number}ch", "{number}%"]

  attr_extra_styles()

  attr :rest, :global

  def skeleton_display_text(assigns) do
    assigns =
      assigns
      |> assign(:class, build_class(assigns))
      |> assign(:style, assigns |> style() |> extra_styles(assigns))

    ~H"""
    <div class={["Polaris-SkeletonDisplayText__DisplayText", @class]} style={@style} {@rest}></div>
    """
  end

  def build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&class/1) |> Enum.join(" ")

  defp class({:size, value}), do: ["Polaris-SkeletonDisplayText--size#{Macro.camelize(value)}"]
  defp class({_key, _value}), do: []

  @doc "Build Style elements"
  def style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style(&1, attrs)) |> Enum.join(";")

  defp build_style({:max_width, value}, _attrs), do: to_style(:max_width, value)

  defp build_style({_key, _value}, _attrs), do: []
end
