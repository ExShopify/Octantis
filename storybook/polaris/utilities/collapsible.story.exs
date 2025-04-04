defmodule Storybook.Polaris.Collapsible do
  use PhoenixStorybook.Story, :component

  def imports, do: [{OctantisWeb.Components.Polaris.Text, text: 1}]

  def function, do: &OctantisWeb.Components.Polaris.Collapsible.collapsible/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a collapse</.text>|],
            attributes: %{open: true}
          }
        ]
      },
      %VariationGroup{
        id: :closed,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a collapse</.text>|],
            attributes: %{open: false}
          }
        ]
      }
    ]
  end
end
