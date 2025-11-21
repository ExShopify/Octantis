defmodule Storybook.PolarisWC.STooltipStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_tooltip/1

  def template do
    """
    <.stylesheet psb-code-hidden/>
    <.javascript psb-code-hidden/>

    <.s_button interest_for=":variation_id-default" accessibility_label="Bold">B</.s_button>

    <.psb-variation-group/>
    """
  end

  def imports,
    do: [
      {OctantisWeb.Components.Head, stylesheet: 1},
      {OctantisWeb.Components.Head, javascript: 1},
      {OctantisWeb.Components.PolarisWC.SButton, s_button: 1}
    ]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              Bold
              """
            ],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
