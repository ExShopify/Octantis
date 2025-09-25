defmodule Storybook.PolarisWC.SButtonGroupStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_button_group/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:s_button_primary>Save</:s_button_primary>
              """,
              ~s"""
              <:s_button_secondary>Cancel</:s_button_secondary>
              """
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :no_gap,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:s_button_primary>Save</:s_button_primary>
              """,
              ~s"""
              <:s_button_secondary>Cancel</:s_button_secondary>
              """
            ],
            attributes: %{gap: "none"}
          }
        ]
      }
    ]
  end
end
