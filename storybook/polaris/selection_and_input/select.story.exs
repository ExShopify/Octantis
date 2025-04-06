defmodule Storybook.Polaris.SkeletonDisplayText do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Select.select/1

  @field Phoenix.Component.to_form(%{"value" => "today"})[:value]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            attributes: %{
              label: "Date range",
              field: @field,
              options: [Today: "today", Yesterday: "yesterday", "Last 7 days": "lastWeek"]
            }
          }
        ]
      },
      %VariationGroup{
        id: :grouping,
        variations: [
          %Variation{
            id: :default,
            attributes: %{
              label: "Date range",
              field: @field,
              options: [
                Times: [Today: "today", Yesterday: "yesterday", "Last 7 days": "lastWeek"]
              ]
            }
          }
        ]
      }
    ]
  end
end
