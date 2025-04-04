defmodule Storybook.Polaris.SkeletonDisplayText do
  use PhoenixStorybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Filters.filters_bar/1
  def imports, do: [{OctantisWeb.Components.Polaris.ChoiceList, choice_list: 1}]

  alias OctantisWeb.Components.Polaris.Filters.Filter

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              filters: [
                %Filter{
                  key: :default,
                  label: "Filter Example",
                  pinned: true,
                  choices: [
                    %Filter.Choice{label: "Enabled", value: "enabled"},
                    %Filter.Choice{label: "Not invited", value: "not invited"},
                    %Filter.Choice{label: "Invited", value: "invited"},
                    %Filter.Choice{label: "Declined", value: "declined"}
                  ]
                }
              ]
            }
          }
        ]
      },
      %VariationGroup{
        id: :multiple,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              filters: [
                %Filter{
                  key: :example,
                  label: "Filter Example",
                  pinned: true,
                  choices: [
                    %Filter.Choice{label: "Enabled", value: "enabled"},
                    %Filter.Choice{label: "Not invited", value: "not invited"},
                    %Filter.Choice{label: "Invited", value: "invited"},
                    %Filter.Choice{label: "Declined", value: "declined"}
                  ]
                },
                %Filter{
                  key: :other,
                  label: "Other Example",
                  pinned: true,
                  choices: [
                    %Filter.Choice{label: "Enabled", value: "enabled"},
                    %Filter.Choice{label: "Not invited", value: "not invited"},
                    %Filter.Choice{label: "Invited", value: "invited"},
                    %Filter.Choice{label: "Declined", value: "declined"}
                  ]
                },
                %Filter{
                  key: :further,
                  label: "Further Example",
                  pinned: true,
                  choices: [
                    %Filter.Choice{label: "Enabled", value: "enabled"},
                    %Filter.Choice{label: "Not invited", value: "not invited"},
                    %Filter.Choice{label: "Invited", value: "invited"},
                    %Filter.Choice{label: "Declined", value: "declined"}
                  ]
                }
              ]
            }
          }
        ]
      },
      %VariationGroup{
        id: :not_pinned,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              filters: [
                %Filter{
                  key: :default,
                  label: "Filter Example",
                  pinned: false,
                  choices: [
                    %Filter.Choice{label: "Enabled", value: "enabled"},
                    %Filter.Choice{label: "Not invited", value: "not invited"},
                    %Filter.Choice{label: "Invited", value: "invited"},
                    %Filter.Choice{label: "Declined", value: "declined"}
                  ]
                }
              ]
            }
          }
        ]
      }
    ]
  end
end
