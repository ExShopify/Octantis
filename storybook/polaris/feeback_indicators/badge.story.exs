defmodule Storybook.Polaris.Badge do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Badge.badge/1

  def aliases, do: [OctantisWeb.Components.Polaris.Icons]

  def imports,
    do: [
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Fulfilled|
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :badge,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:icon><Icons.plus_circle /></:icon>|,
              ~s|Megaplus|
            ],
            attributes: %{tone: "success"}
          }
        ]
      },
      %VariationGroup{
        id: :small,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Fulfilled|
            ],
            attributes: %{size: "small"}
          }
        ]
      },
      %VariationGroup{
        id: :informational,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Draft|
            ],
            attributes: %{tone: "info"}
          }
        ]
      },
      %VariationGroup{
        id: :success,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Active|
            ],
            attributes: %{tone: "success"}
          }
        ]
      },
      %VariationGroup{
        id: :attention,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Open|
            ],
            attributes: %{tone: "attention"}
          }
        ]
      },
      %VariationGroup{
        id: :warning,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|On hold|
            ],
            attributes: %{tone: "warning"}
          }
        ]
      },
      %VariationGroup{
        id: :critical,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Action required|
            ],
            attributes: %{tone: "critical"}
          }
        ]
      },
      %VariationGroup{
        id: :unfulfilled,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Unfulfilled|
            ],
            attributes: %{progress: "incomplete", tone: "attention"}
          }
        ]
      },
      %VariationGroup{
        id: :partially_complete,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Unfulfilled|
            ],
            attributes: %{progress: "partiallyComplete", tone: "warning"}
          }
        ]
      },
      %VariationGroup{
        id: :complete,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Fulfilled|
            ],
            attributes: %{progress: "complete"}
          }
        ]
      },
      %VariationGroup{
        id: :tone_and_progress_label_override,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Published|
            ],
            attributes: %{
              tone: "success",
              progress: "complete",
              accessibility_label: "Status: Published. Your online store is visible."
            }
          }
        ]
      }
    ]
  end
end
