defmodule Storybook.Polaris.SkeletonDisplayText do
  use OctantisWeb.Storybook.Story, :component

  def function,
    do: &OctantisWeb.Components.Polaris.SkeletonDisplayText.skeleton_display_text/1

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
      }
    ]
  end
end
