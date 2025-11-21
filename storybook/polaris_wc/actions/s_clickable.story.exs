defmodule Storybook.PolarisWC.SClickableStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_clickable/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              Create Store
              """
            ],
            attributes: %{padding: "base"}
          }
        ]
      },
      %VariationGroup{
        id: :expanded,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              View Shipping Settings
              """
            ],
            attributes: %{
              border: "base",
              padding: "base",
              background: "subdued",
              border_radius: "base"
            }
          }
        ]
      }
    ]
  end
end
