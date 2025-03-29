defmodule Storybook.Polaris.SkeletonBodyText do
  use PhoenixStorybook.Story, :component

  def function,
    do: &OctantisWeb.Components.Polaris.SkeletonBodyText.skeleton_body_text/1

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
        id: :single_line,
        variations: [
          %Variation{
            id: :default,
            attributes: %{lines: 1}
          }
        ]
      }
    ]
  end
end
