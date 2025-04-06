defmodule Storybook.Polaris.Page do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Polaris.Card, card: 1},
      {OctantisWeb.Components.Polaris.Badge, badge: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def aliases, do: [OctantisWeb.Components.Polaris.Icons]

  def function, do: &OctantisWeb.Components.Polaris.Page.page/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|<.card>Content inside a page</.card>|],
            attributes: %{
              # backAction: {{content: 'Products', url: '#'}},
              title: "Invoice",
              subtitle: "Statement period: May 3, 2019 to June 2, 2019"
              # secondaryActions: {[{content: 'Download', icon: ArrowDownIcon}]}
            }
          }
        ]
      },
      %VariationGroup{
        id: :with_badge,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:title_metadata><.badge><:icon><Icons.check /></:icon>Fulfilled</.badge></:title_metadata>|,
              ~s|<.card>Content inside a page</.card>|
            ],
            attributes: %{
              title: "Invoice"
            }
          }
        ]
      },
      %VariationGroup{
        id: :with_secondary_action,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.card>Content inside a page</.card>|,
              ~s|<:secondary_action content="Secondary Action"/>|
            ],
            attributes: %{
              # backAction: {{content: 'Products', url: '#'}},
              title: "Invoice",
              subtitle: "Statement period: May 3, 2019 to June 2, 2019"
              # secondaryActions: {[{content: 'Download', icon: ArrowDownIcon}]}
            }
          }
        ]
      },
      %VariationGroup{
        id: :with_primary_action,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.card>Content inside a page</.card>|,
              ~s|<:secondary_action content="Secondary Action"/>|,
              ~s|<:primary_action content="Primary Action"/>|
            ],
            attributes: %{
              # backAction: {{content: 'Products', url: '#'}},
              title: "Invoice",
              subtitle: "Statement period: May 3, 2019 to June 2, 2019"
              # secondaryActions: {[{content: 'Download', icon: ArrowDownIcon}]}
            }
          }
        ]
      },
      %VariationGroup{
        id: :with_back_action,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<.card>Content inside a page</.card>|,
              ~s|<:back_action content="Secondary Action"/>|,
              ~s|<:secondary_action content="Secondary Action"/>|,
              ~s|<:primary_action content="Primary Action"/>|
            ],
            attributes: %{
              # backAction: {{content: 'Products', url: '#'}},
              title: "Invoice",
              subtitle: "Statement period: May 3, 2019 to June 2, 2019"
              # secondaryActions: {[{content: 'Download', icon: ArrowDownIcon}]}
            }
          }
        ]
      }
    ]
  end
end
