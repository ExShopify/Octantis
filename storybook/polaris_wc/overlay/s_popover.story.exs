defmodule Storybook.PolarisWC.SPopoverStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_popover/1

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
      {OctantisWeb.Storybook.Sigil, sigil_o: 2}
    ]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"""
              <s-stack direction="column" gap="small-500" padding="small-200 small-300">
                <s-button variant="tertiary">Import</s-button>
                <s-button variant="tertiary">Export</s-button>
              </s-stack>
              """
            ],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
