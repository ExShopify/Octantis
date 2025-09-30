defmodule OctantisWeb.Components.Polaris.Thumbnail do
  @moduledoc """
  Use thumbnails as a visual anchor and identifier for an object. They should be used along with text to provide context.

  ## Examples
  ```elixir
  <.thumbnail source="https://picsum.photos/250" alt="Promotional image"/>
  ```

  ## See
   - https://polaris.shopify.com/components/images-and-icons/thumbnail?example=thumbnail-default
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Thumbnail/Thumbnail.tsx
  """

  use OctantisWeb.Core, :component

  import_polaris_components([:image])

  @doc @moduledoc

  attr :size, :string,
    values: ["extraSmall", "small", "medium", "large"],
    default: "medium",
    doc: "Size of thumbnail"

  attr :source, :string, required: true, doc: "URL for the image"
  attr :alt, :string, default: nil, doc: "Alt text for the thumbnail image"
  attr :transparent, :boolean, default: false, doc: "Transparent background"

  def thumbnail(assigns) do
    assigns =
      assigns
      |> assign(:class, class(assigns))

    ~H"""
    <div class={["Polaris-Thumbnail", @class]}>
      <.image alt={@alt} source={@source} />
    </div>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:size, value}), do: ["Polaris-Thumbnail--size#{Macro.camelize(value)}"]
  defp build_class({:transparent, true}), do: ["Polaris-Thumbnail--transparent"]
  defp build_class({_key, _value}), do: []
end
