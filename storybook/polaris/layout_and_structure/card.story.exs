defmodule Storybook.Polaris.Card do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.BlockStack, block_stack: 1},
      {OctantisWeb.Components.Polaris.Box, box: 1},
      {OctantisWeb.Components.Polaris.Divider, divider: 1},
      {OctantisWeb.Components.Polaris.Button, button: 1},
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def function, do: &OctantisWeb.Components.Polaris.Card.card/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a card</.text>|],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :with_subdued_background,
        variations: [
          %Variation{
            id: :with_subdued_background,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a card</.text>|],
            attributes: %{
              background: "bg-surface-secondary"
            }
          }
        ]
      },
      %VariationGroup{
        id: :with_varying_padding,
        variations: [
          %Variation{
            id: :with_varying_padding_none,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a card</.text>|],
            attributes: %{}
          },
          %Variation{
            id: :with_varying_padding_400,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a card</.text>|],
            attributes: %{
              padding: "400"
            }
          },
          %Variation{
            id: :with_varying_padding_200,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a card</.text>|],
            attributes: %{
              padding: "200"
            }
          },
          %Variation{
            id: :with_varying_padding_0,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a card</.text>|],
            attributes: %{
              padding: "0"
            }
          }
        ]
      },
      %VariationGroup{
        id: :rounded_corners,
        variations: [
          %Variation{
            id: :rounded_corners,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a card</.text>|],
            attributes: %{
              rounded_above: "md",
              background: "bg-surface-secondary"
            }
          }
        ]
      },
      %VariationGroup{
        id: :no_rounded_corners,
        variations: [
          %Variation{
            id: :rounded_corners,
            slots: [~s|<.text as="h2" variant="bodyMd">Content inside a card</.text>|],
            attributes: %{
              border_radius: [xs: "0"],
              background: "bg-surface-secondary"
            }
          }
        ]
      },
      %VariationGroup{
        id: :complex,
        variations: [
          %Variation{
            id: :rounded_corners,
            slots: [
              ~s"""
                <.block_stack>
                  <.box background="bg-surface-secondary" padding={[xs: "300"]}>
                    <.text as="h6" variant="headingMd">Header</.text>
                  </.box>
                  <.divider />
                  <.box padding={[xs: "200"]}>
                    <.text as="p" variant="bodyMd">Content inside a card's body</.text>
                  </.box>
                  <.divider />
                  <.box padding={[xs: "200"]}>
                    <.button content="call to action" full_width/>
                  </.box>
                </.block_stack>
              """
            ],
            attributes: %{
              padding: [xs: "0"],
              min_width: "100%"
            }
          }
        ]
      }
    ]
  end
end
