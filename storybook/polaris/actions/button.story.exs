defmodule Storybook.Polaris.Button do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def function, do: &OctantisWeb.Components.Polaris.Button.button/1

  def aliases, do: [OctantisWeb.Components.Polaris.Icons]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|default|],
            attributes: %{}
          },
          %Variation{
            id: :critical,
            slots: [~s|default critical|],
            attributes: %{tone: "critical"}
          },
          %Variation{
            id: :success,
            slots: [~s|default success|],
            attributes: %{tone: "success"}
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
        id: :primary,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|primary|],
            attributes: %{variant: "primary"}
          },
          %Variation{
            id: :critical,
            slots: [~s|primary critical|],
            attributes: %{variant: "primary", tone: "critical"}
          },
          %Variation{
            id: :success,
            slots: [~s|primary success|],
            attributes: %{variant: "primary", tone: "success"}
          }
        ]
      },
      %VariationGroup{
        id: :secondary,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|secondary|],
            attributes: %{variant: "secondary"}
          },
          %Variation{
            id: :critical,
            slots: [~s|secondary critical|],
            attributes: %{variant: "secondary", tone: "critical"}
          },
          %Variation{
            id: :success,
            slots: [~s|secondary success|],
            attributes: %{variant: "secondary", tone: "success"}
          }
        ]
      },
      %VariationGroup{
        id: :tertiary,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|tertiary|],
            attributes: %{variant: "tertiary"}
          },
          %Variation{
            id: :critical,
            slots: [~s|tertiary critical|],
            attributes: %{variant: "tertiary", tone: "critical"}
          },
          %Variation{
            id: :success,
            slots: [~s|tertiary success|],
            attributes: %{variant: "tertiary", tone: "success"}
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
        id: :monochrome_plain,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|monochromePlain|],
            attributes: %{variant: "monochromePlain"}
          },
          %Variation{
            id: :critical,
            slots: [~s|monochromePlain critical|],
            attributes: %{variant: "monochromePlain", tone: "critical"}
          },
          %Variation{
            id: :success,
            slots: [~s|monochromePlain success|],
            attributes: %{variant: "monochromePlain", tone: "success"}
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
