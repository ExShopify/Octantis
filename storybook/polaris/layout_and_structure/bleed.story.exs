defmodule Storybook.Polaris.Bleed do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Card, card: 1},
      {OctantisWeb.Components.Polaris.InlineStack, inline_stack: 1},
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def function, do: &OctantisWeb.Components.Polaris.Bleed.bleed/1

  def template do
    """
    <.card padding={[xs: "0"]}>
      <.text as="h2" variant="bodyMd">
            Content inside a card
      </.text>
      <.psb-variation/>
    </.card>
    """
  end

  def variations do
    [
      %VariationGroup{
        id: :horizontal,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.inline_stack gap={[xs: "400"]}} align="center"><.text  as="h2">marginInline</.text></.inline_stack>|
            ],
            attributes: %{margin_inline: [xs: "400"]}
          }
        ]
      },
      %VariationGroup{
        id: :vertical,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.inline_stack gap={[xs: "400"]}} align="center"><.text  as="h2">marginBlock</.text></.inline_stack>|
            ],
            attributes: %{margin_block: [xs: "400"]}
          }
        ]
      }
    ]
  end
end
