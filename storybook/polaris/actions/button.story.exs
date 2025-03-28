defmodule Storybook.Polaris.Button do
  use PhoenixStorybook.Story, :component

  def imports, do: [{OctantisWeb.Components.Polaris.Text, text: 1}]

  def function, do: &OctantisWeb.Components.Polaris.Button.button/1

  def aliases, do: [OctantisWeb.Components.Polaris.Icons]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Add product|],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :plain,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|View shipping settings|],
            attributes: %{variant: "plain"}
          }
        ]
      },
      %VariationGroup{
        id: :tertiary,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|View shipping settings|],
            attributes: %{variant: "tertiary"}
          }
        ]
      },
      %VariationGroup{
        id: :plain_critical,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Remove|],
            attributes: %{variant: "plain", tone: "critical"}
          }
        ]
      },
      %VariationGroup{
        id: :primary,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Save theme|],
            attributes: %{variant: "primary"}
          }
        ]
      },
      %VariationGroup{
        id: :primary_critical,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|View shipping settings|],
            attributes: %{variant: "primary", tone: "critical"}
          }
        ]
      },
      %VariationGroup{
        id: :large,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Create store|],
            attributes: %{size: "large"}
          }
        ]
      },
      %VariationGroup{
        id: :full_width,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Add customer|],
            attributes: %{full_width: true}
          }
        ]
      },
      %VariationGroup{
        id: :text_alligned,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|
              This is a really long string of text that overflows onto the next line we
              need to put in a lot of words now you can see the alignment. It is very
              long but a customer could potentially name something this long.
              |],
            attributes: %{variant: "plain", text_align: "left"}
          }
        ]
      },
      %VariationGroup{
        id: :with_icon,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Add Theme|, ~s|<:icon><Icons.adjust /></:icon>|],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
