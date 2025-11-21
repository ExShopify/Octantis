defmodule Storybook.PolarisWC.SSpinnerStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_spinner/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :large,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{size: "large"}
          }
        ]
      }
    ]
  end
end
