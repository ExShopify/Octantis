defmodule Storybook.Polaris.Tag do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Tag.tag/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Wholesale|],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
