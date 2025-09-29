defmodule Storybook.PolarisWC.SBannerStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_banner/1

  def imports,
    do: [
      {OctantisWeb.Components.Head, stylesheet: 1},
      {OctantisWeb.Components.Head, javascript: 1},
      {OctantisWeb.Components.PolarisWC.SSection, s_section: 1}
    ]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|This order was archived on March 7, 2017 at 3:12pm EDT.|
            ],
            attributes: %{heading: "Order archived", tone: "info", dismissible: true}
          }
        ]
      },
      %VariationGroup{
        id: :secondary_action,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|This order was archived on March 7, 2017 at 3:12pm EDT.|,
              ~s|<:secondary_action>Ok</:secondary_action>|,
              ~s|<:secondary_action>Cancel</:secondary_action>|
            ],
            attributes: %{heading: "Order archived", tone: "info", dismissible: true}
          }
        ]
      },
      %VariationGroup{
        id: :in_section,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|This order was archived on March 7, 2017 at 3:12pm EDT.|,
              ~s|<:secondary_action>Ok</:secondary_action>|,
              ~s|<:secondary_action>Cancel</:secondary_action>|
            ],
            attributes: %{heading: "Order archived", tone: "info", dismissible: true}
          }
        ],
        template: """
        <.s_section>
          <.psb-variation-group/>
        </.s_section>
        """
      }
    ]
  end
end
