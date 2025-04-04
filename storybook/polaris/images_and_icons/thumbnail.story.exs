defmodule Storybook.Polaris.Thumbnail do
  use PhoenixStorybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Thumbnail.thumbnail/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{source: "https://picsum.photos/250", alt: "Promotional image"}
          }
        ]
      },
      %VariationGroup{
        id: :extra_small,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              size: "extraSmall",
              source: "https://picsum.photos/250",
              alt: "Promotional image"
            }
          }
        ]
      },
      %VariationGroup{
        id: :small,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              size: "small",
              source: "https://picsum.photos/250",
              alt: "Promotional image"
            }
          }
        ]
      },
      %VariationGroup{
        id: :large,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              size: "large",
              source: "https://picsum.photos/250",
              alt: "Promotional image"
            }
          }
        ]
      },
      %VariationGroup{
        id: :large_source,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{source: "https://picsum.photos/750", alt: "Promotional image"}
          }
        ]
      },
      %VariationGroup{
        id: :vertical,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{source: "https://picsum.photos/100/200", alt: "Promotional image"}
          }
        ]
      },
      %VariationGroup{
        id: :horizontal,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{source: "https://picsum.photos/200/100", alt: "Promotional image"}
          }
        ]
      }
    ]
  end
end
