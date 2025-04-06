defmodule Storybook.Polaris.Filters do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Filters.filters/1

  alias OctantisWeb.Components.Polaris.Filters.Filter

  @form Phoenix.Component.to_form(%{"value" => ""})

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
        id: :some_selected,
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
                    %Filter.Choice{label: "Not invited", value: "not invited", selected: true},
                    %Filter.Choice{label: "Invited", value: "invited"},
                    %Filter.Choice{label: "Declined", value: "declined"}
                  ]
                },
                %Filter{
                  key: :other,
                  label: "Other Example",
                  pinned: true,
                  choices: [
                    %Filter.Choice{label: "Enabled", value: "enabled", selected: true},
                    %Filter.Choice{label: "Not invited", value: "not invited", selected: true},
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
        id: :single,
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
        id: :search,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              query_form: @form,
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
      }
    ]
  end
end
