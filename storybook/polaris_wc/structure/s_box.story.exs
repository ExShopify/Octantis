defmodule Storybook.PolarisWC.SBoxStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_box/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: ["Box"],
            attributes: %{background: "strong", padding: "large-200", border_radius: "small-100"}
          }
        ]
      }
    ]
  end
end
