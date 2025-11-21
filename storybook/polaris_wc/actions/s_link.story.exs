defmodule Storybook.PolarisWC.SLinkStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_link/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              fufilling orders
              """
            ],
            attributes: %{href: "#beep"}
          }
        ]
      }
    ]
  end
end
