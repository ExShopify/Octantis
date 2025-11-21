defmodule Storybook.PolarisWC.SUnorderedListStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_unordered_list/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:s_list_item>Red shirt</:s_list_item>|,
              ~s|<:s_list_item>Green shirt</:s_list_item>|,
              ~s|<:s_list_item>Blue shirt</:s_list_item>|
            ],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
