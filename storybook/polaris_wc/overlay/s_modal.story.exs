defmodule Storybook.PolarisWC.SModalStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_modal/1

  def template do
    """
    <.stylesheet psb-code-hidden/>
    <.javascript psb-code-hidden/>

    <.s_button command_for=":variation_id-default">Open</.s_button>

    <.psb-variation-group/>

    """
  end

  def imports,
    do: [
      {OctantisWeb.Components.Head, stylesheet: 1},
      {OctantisWeb.Components.Head, javascript: 1},
      {OctantisWeb.Components.Polaris, s_button: 1},
      {OctantisWeb.Components.Polaris, s_paragraph: 1}
    ]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S|<.s_paragraph>Displaying more details here</.s_paragraph>|,
              ~S|<:secondary_action command_for="modal" command="--hide">Close</:secondary_action>|,
              ~S|<:primary_action command_for="modal" command="--hide">Save</:primary_action>|
            ],
            attributes: %{heading: "Details"}
          }
        ]
      }
    ]
  end
end
