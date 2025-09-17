defmodule Storybook.PolarisWC.SButtonStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_button/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"""
              Button
              """
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :styled,
        variations: [
          %Variation{
            id: :critical,
            slots: [
              ~S"""
              critical
              """
            ],
            attributes: %{tone: "critical"}
          },
          %Variation{
            id: :auto,
            slots: [
              ~S"""
              auto
              """
            ],
            attributes: %{tone: "auto"}
          },
          %Variation{
            id: :neutral,
            slots: [
              ~S"""
              neutral
              """
            ],
            attributes: %{tone: "neutral"}
          }
        ]
      },
      %VariationGroup{
        id: :variants,
        variations: [
          %Variation{
            id: :neutral_auto,
            slots: [
              ~S"""
              neutral auto
              """
            ],
            attributes: %{tone: "neutral", variant: "auto"}
          },
          %Variation{
            id: :neutral_primary,
            slots: [
              ~S"""
              neutral primary
              """
            ],
            attributes: %{tone: "neutral", variant: "primary"}
          },
          %Variation{
            id: :neutral_secondary,
            slots: [
              ~S"""
              neutral secondary
              """
            ],
            attributes: %{tone: "neutral", variant: "secondary"}
          },
          %Variation{
            id: :neutral_tertiary,
            slots: [
              ~S"""
              neutral tertiary
              """
            ],
            attributes: %{tone: "neutral", variant: "tertiary"}
          },
          %Variation{
            id: :critical_auto,
            slots: [
              ~S"""
              critical auto
              """
            ],
            attributes: %{tone: "critical", variant: "auto"}
          },
          %Variation{
            id: :critical_primary,
            slots: [
              ~S"""
              critical primary
              """
            ],
            attributes: %{tone: "critical", variant: "primary"}
          },
          %Variation{
            id: :critical_secondary,
            slots: [
              ~S"""
              critical secondary
              """
            ],
            attributes: %{tone: "critical", variant: "secondary"}
          },
          %Variation{
            id: :critical_tertiary,
            slots: [
              ~S"""
              critical tertiary
              """
            ],
            attributes: %{tone: "critical", variant: "tertiary"}
          },
          %Variation{
            id: :auto_auto,
            slots: [
              ~S"""
              auto auto
              """
            ],
            attributes: %{tone: "auto", variant: "auto"}
          },
          %Variation{
            id: :auto_primary,
            slots: [
              ~S"""
              auto primary
              """
            ],
            attributes: %{tone: "auto", variant: "primary"}
          },
          %Variation{
            id: :auto_secondary,
            slots: [
              ~S"""
              auto secondary
              """
            ],
            attributes: %{tone: "auto", variant: "secondary"}
          },
          %Variation{
            id: :auto_tertiary,
            slots: [
              ~S"""
              auto tertiary
              """
            ],
            attributes: %{tone: "auto", variant: "tertiary"}
          }
        ]
      },
      %VariationGroup{
        id: :states,
        variations: [
          %Variation{
            id: :loading,
            slots: [
              ~S"""
              loading
              """
            ],
            attributes: %{loading: true}
          },
          %Variation{
            id: :disabled,
            slots: [
              ~S"""
              auto
              """
            ],
            attributes: %{disabled: true}
          }
        ]
      },
      %VariationGroup{
        id: :icon,
        variations: [
          %Variation{
            id: :replace,
            slots: [
              ~S"""
              replace
              """
            ],
            attributes: %{icon: "replace"}
          },
          %Variation{
            id: :camera,
            slots: [
              ~S"""
              camera
              """
            ],
            attributes: %{icon: "camera"}
          }
        ]
      }
    ]
  end
end
