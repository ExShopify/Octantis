defmodule Storybook.PolarisWC.SPopover do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.PolarisWC.SPopover.s_popover/1

  def template do
    """
    <.stylesheet psb-code-hidden/>
    <.javascript psb-code-hidden/>

    <s-button commandFor=":variation_id-default">Open</s-button>

    <.psb-variation-group/>

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
