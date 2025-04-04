defmodule Storybook.Polaris.EmptyState do
  use PhoenixStorybook.Story, :component

  def imports, do: [{OctantisWeb.Components.Polaris.Text, text: 1}]

  def function, do: &OctantisWeb.Components.Polaris.EmptyState.empty_state/1

  def variations do
    [
      %VariationGroup{
        id: :sections,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:action content="Browse section library" />|,
              ~s|Expand your theme with Flash Sections directly customizable in the Theme Editor|
            ],
            attributes: %{
              image: "/images/relax.svg",
              heading: "You don't have sections"
            }
          }
        ]
      },
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:action content="Add transfer" />|,
              ~s|<:secondary_action content="Learn more" />|,
              ~s|Track and receive your incoming inventory from suppliers.|
            ],
            attributes: %{
              image:
                "https://cdn.shopify.com/s/files/1/0262/4071/2726/files/emptystate-files.png",
              heading: "Manage your inventory transfers"
            }
          }
        ]
      }
    ]
  end
end
