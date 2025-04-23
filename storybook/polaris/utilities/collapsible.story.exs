defmodule Storybook.Polaris.Collapsible do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Button, button: 1},
      {OctantisWeb.Components.Polaris.Card, card: 1},
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def function, do: &OctantisWeb.Components.Polaris.Collapsible.collapsible/1

  def template do
    """
    <.stylesheet psb-code-hidden/>
    <div class="my-custom-wrapper" psb-code-hidden>
      <.button phx_click={Collapsible.open(":variation_id")} >Open</.button>
      <.button phx_click={Collapsible.close(":variation_id")} >Close</.button>
      <.psb-variation/>
    </div>
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
              ~s|<.card><.text as="h2" variant="bodyMd">Content inside a collapse</.text></.card>|
            ],
            attributes: %{open: true}
          }
        ]
      },
      %VariationGroup{
        id: :closed,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.card><.text as="h2" variant="bodyMd">Content inside a collapse</.text></.card>|
            ],
            attributes: %{open: false}
          }
        ]
      }
    ]
  end
end
