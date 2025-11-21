defmodule Storybook.PolarisWC.SHeadingStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_heading/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              Online store dashboard
              """
            ],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
