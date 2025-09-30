defmodule Storybook.PolarisWC.SBannerStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_banner/1

  def imports do
    [
      {OctantisWeb.Components.Head, stylesheet: 1},
      {OctantisWeb.Components.Head, javascript: 1},
      {OctantisWeb.Components.Polaris, s_page: 1},
      {OctantisWeb.Components.Polaris, s_section: 1}
    ]
  end

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
        ],
        template: """
        <.stylesheet psb-code-hidden/>
        <.javascript psb-code-hidden/>
        <.s_page >
          <.psb-variation-group/>
        </.s_page>
        """
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
        ],
        template: """
        <.stylesheet psb-code-hidden/>
        <.javascript psb-code-hidden/>
        <.s_page >
          <.psb-variation-group/>
        </.s_page>
        """
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
        ]
      }
    ]
  end
end
