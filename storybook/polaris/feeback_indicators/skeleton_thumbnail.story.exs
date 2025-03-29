defmodule Storybook.Polaris.SkeletonThumbnail do
  use PhoenixStorybook.Story, :component

  def function,
    do: &OctantisWeb.Components.Polaris.SkeletonThumbnail.skeleton_thumbnail/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :large,
        variations: [
          %Variation{
            id: :default,
            attributes: %{size: "large"}
          }
        ]
      },
      %VariationGroup{
        id: :small,
        variations: [
          %Variation{
            id: :default,
            attributes: %{size: "small"}
          }
        ]
      },
      %VariationGroup{
        id: :extra_small,
        variations: [
          %Variation{
            id: :default,
            attributes: %{size: "extraSmall"}
          }
        ]
      }
    ]
  end
end
