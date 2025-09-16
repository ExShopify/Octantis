defmodule Storybook.PolarisWC.SBadgeStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.PolarisWC.SBadge.s_badge/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"Fulfilled"
            ],
            attributes: %{}
          },
          %Variation{
            id: :info,
            slots: [
              ~S"Draft"
            ],
            attributes: %{tone: "info"}
          },
          %Variation{
            id: :success,
            slots: [
              ~S"Active"
            ],
            attributes: %{tone: "success"}
          },
          %Variation{
            id: :caution,
            slots: [
              ~S"Open"
            ],
            attributes: %{tone: "caution"}
          },
          %Variation{
            id: :warning,
            slots: [
              ~S"On hold"
            ],
            attributes: %{tone: "warning"}
          },
          %Variation{
            id: :critical,
            slots: [
              ~S"Action required"
            ],
            attributes: %{tone: "critical"}
          }
        ]
      },
      %VariationGroup{
        id: :icon,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"Draft"
            ],
            attributes: %{icon: "info"}
          }
        ]
      },
      %VariationGroup{
        id: :size,
        variations: [
          %Variation{
            id: :base,
            slots: [
              ~S"Base"
            ],
            attributes: %{size: "base"}
          },
          %Variation{
            id: :large,
            slots: [
              ~S"Base"
            ],
            attributes: %{size: "large"}
          },
          %Variation{
            id: :large_100,
            slots: [
              ~S"large-100"
            ],
            attributes: %{size: "large-100"}
          }
        ]
      },
      %VariationGroup{
        id: :colour,
        variations: [
          %Variation{
            id: :base,
            slots: [
              ~S"Base"
            ],
            attributes: %{tone: "success", color: "base"}
          },
          %Variation{
            id: :large,
            slots: [
              ~S"Strong"
            ],
            attributes: %{tone: "success", color: "strong"}
          },
          %Variation{
            id: :base_critical,
            slots: [
              ~S"Base"
            ],
            attributes: %{tone: "critical", color: "base"}
          },
          %Variation{
            id: :large_critical,
            slots: [
              ~S"Strong"
            ],
            attributes: %{tone: "critical", color: "strong"}
          }
        ]
      }
    ]
  end
end
