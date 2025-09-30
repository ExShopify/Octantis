defmodule Storybook.PolarisWC.SSectionStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_section/1

  def imports,
    do: [
      {OctantisWeb.Components.Head, stylesheet: 1},
      {OctantisWeb.Components.Head, javascript: 1},
      {OctantisWeb.Components.Polaris, s_page: 1},
      {OctantisWeb.Components.Polaris, s_paragraph: 1}
    ]

  def template do
    """
    <.stylesheet psb-code-hidden/>
    <.javascript psb-code-hidden/>
    <.s_page psb-code-hidden>
      <.psb-variation-group/>
    </.s_page>
    """
  end

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <.s_paragraph>
              View a summary of your online store’s performance.
              </.s_paragraph>
              """
            ],
            attributes: %{heading: "Online store dashboard"}
          }
        ]
      },
      %VariationGroup{
        id: :nested,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <.s_section heading="Online store dashboard">
                <.s_paragraph>
                View a summary of your online store’s performance.
                </.s_paragraph>
              </.s_section>
              <.s_section heading="Online store dashboard">
                <.s_paragraph>
                View a summary of your online store’s performance.
                </.s_paragraph>
              </.s_section>

              """
            ],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
