defmodule Storybook.PolarisWC.STextStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_text/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :strong,
            slots: [~s|Name:|],
            attributes: %{type: "strong"}
          },
          %Variation{
            id: :default,
            slots: [~s|Jane Doe|],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
