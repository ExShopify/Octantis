defmodule Storybook.PolarisWC.SSearchFieldStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_search_field/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              label: "Search",
              label_accessibility_visibility: "exclusive",
              field: {:eval, ~s|Phoenix.Component.to_form(%{"value" => "some search"})[:value]|},
              placeholder: "Search items"
            }
          }
        ]
      }
    ]
  end
end
