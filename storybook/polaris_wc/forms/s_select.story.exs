defmodule Storybook.PolarisWC.SSelectStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_select/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:s_option value="1">Today</:s_option>|,
              ~s|<:s_option value="2">Yesterday</:s_option>|,
              ~s|<:s_option value="3">Last 7 days</:s_option>|
            ],
            attributes: %{
              label: "Date range",
              field: {:eval, ~s|Phoenix.Component.to_form(%{"value" => "1"})[:value]|}
            }
          }
        ]
      }
    ]
  end
end
