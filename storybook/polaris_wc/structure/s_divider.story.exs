defmodule Storybook.PolarisWC.SDividerStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.PolarisWC.SDivider.s_divider/1

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
        id: :base,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{color: "base"}
          }
        ]
      },
      %VariationGroup{
        id: :strong,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{color: "strong"}
          }
        ]
      },
      %VariationGroup{
        id: :inline,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{direction: "inline"}
          }
        ]
      },
      %VariationGroup{
        id: :block,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{direction: "block"}
          }
        ]
      }
    ]
  end
end
