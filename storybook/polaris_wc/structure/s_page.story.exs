defmodule Storybook.PolarisWC.SDividerStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_page/1

  def imports do
    [
      {OctantisWeb.Components.Head, stylesheet: 1},
      {OctantisWeb.Components.Head, javascript: 1},
      {OctantisWeb.Components.Polaris, s_section: 1},
      {OctantisWeb.Components.Polaris, s_text: 1}
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
              """
              <.s_section>
                <.s_text>Hello World</.s_text>
              </.s_section>
              """
            ],
            attributes: %{heading: "Products"}
          }
        ],
        template: """
        <.stylesheet psb-code-hidden/>
        <.javascript psb-code-hidden/>
        <.psb-variation-group/>
        """
      },
      %VariationGroup{
        id: :complex,
        variations: [
          %Variation{
            id: :complex,
            slots: [
              """
              <.s_section>
                <.s_text>Hello World</.s_text>
              </.s_section>
              """,
              ~s|<:breadcrumb_action>Home</:breadcrumb_action>|,
              ~s|<:breadcrumb_action>Catalog</:breadcrumb_action>|,
              ~s|<:primary_action>Save</:primary_action>|,
              ~s|<:secondary_action>Cancel</:secondary_action>|,
              ~s|<:secondary_action>Unsubscribe</:secondary_action>|,
              ~s|<:secondary_action group={:group}>Grouped 1</:secondary_action>|,
              ~s|<:secondary_action group={:group}>Grouped 2</:secondary_action>|,
              ~s|<:aside>Aside Info Section</:aside>|,
              ~s|<:aside as={:stack}>Any Stack</:aside>|
            ],
            attributes: %{heading: "Products"}
          }
        ],
        template: """
        <.stylesheet psb-code-hidden/>
        <.javascript psb-code-hidden/>
        <.psb-variation-group/>
        """
      }
    ]
  end
end
