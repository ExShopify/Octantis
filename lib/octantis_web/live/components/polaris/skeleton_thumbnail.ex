defmodule OctantisWeb.Components.Polaris.SkeletonThumbnail do
  @moduledoc """
  Skeleton thumbnail is used to provide a low fidelity representation of an image before it appears on the page, and improves load times perceived by merchants. Use for thumbnails in or outside of a card.

  ## Examples
  ```elixir
  </.skeleton_thumbnail>
  ```

  ## See
   - https://polaris.shopify.com/components/feedback-indicators/skeleton-thumbnail
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/SkeletonDisplayText/SkeletonDisplayText.tsx
  """

  use OctantisWeb.Core

  @doc @moduledoc

  attr :size, :string, default: "medium", values: ["extraSmall", "small", "medium", "large"]

  attr_extra_styles()

  attr :rest, :global

  def skeleton_thumbnail(assigns) do
    assigns =
      assigns
      |> assign(:class, build_class(assigns))
      |> assign(:style, extra_styles(assigns))

    ~H"""
    <div class={["Polaris-SkeletonThumbnail", @class]} style={@style} {@rest} />
    """
  end

  def build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&class/1) |> Enum.join(" ")

  defp class({:size, value}), do: ["Polaris-SkeletonThumbnail--size#{Macro.camelize(value)}"]
  defp class({_key, _value}), do: []
end
