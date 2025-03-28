defmodule Storybook.Polaris.ButtonGroup do
  use PhoenixStorybook.Story, :component

  def imports, do: [{OctantisWeb.Components.Polaris.Button, button: 1}]

  def function, do: &OctantisWeb.Components.Polaris.ButtonGroup.button_group/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:button>Cancel</:button>|,
              ~s|<:button variant="primary">Save</:button>|
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :complex_action,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:complex_action content="Cancel" />|,
              ~s|<:complex_action content="Save" variant="primary" />|
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :segmented,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:button>Bold</:button>|,
              ~s|<:button>Italic</:button>|,
              ~s|<:button>Underline</:button>|
            ],
            attributes: %{variant: "segmented"}
          }
        ]
      },
      %VariationGroup{
        id: :pressed_segmented,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:button pressed={true}>Bold</:button>|,
              ~s|<:button>Italic</:button>|,
              ~s|<:button>Underline</:button>|
            ],
            attributes: %{variant: "segmented"}
          }
        ]
      }
    ]
  end
end
