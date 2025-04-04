defmodule Storybook.Polaris.ChoiceList do
  use PhoenixStorybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.ChoiceList.choice_list/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:choice
                label="Use the shipping address as the billing address by default"
                value="shipping"
                help_text="Reduces the number of fields required to check out. The billing address can still be edited."
              />
              """,
              ~s"""
                <:choice
                  label="Require a confirmation step"
                  value="confirmation"
                  help_text="Customers must review their order details before purchasing."
                />
              """
            ],
            attributes: %{
              title: "While the customer is checking out",
              name: "company_name",
              allow_multiple: true,
              phx_change: "phx_change"
            }
          }
        ]
      },
      %VariationGroup{
        id: :error,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:choice label="Choice A" value="a"/>|,
              ~s|<:choice label="Choice B" value="b"/>|,
              ~s|<:choice label="Choice C" value="c"/>|
            ],
            attributes: %{
              title: "Company name",
              error: "Company name cannot be hidden at this time",
              name: "company_name",
              allow_multiple: true
            }
          }
        ]
      },
      %VariationGroup{
        id: :multiple_choice,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:choice label="Choice A" value="a"/>|,
              ~s|<:choice label="Choice B" value="b"/>|,
              ~s|<:choice label="Choice C" value="c"/>|
            ],
            attributes: %{
              title: "While the customer is checking out",
              allow_multiple: true,
              name: "checkout"
            }
          }
        ]
      },
      %VariationGroup{
        id: :selected,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:choice label="Choice A" value="a" selected={true}/>|,
              ~s|<:choice label="Choice B" value="b" selected={true}/>|,
              ~s|<:choice label="Choice C" value="c"/>|
            ],
            attributes: %{
              title: "While the customer is checking out",
              allow_multiple: true,
              name: "checkout"
            }
          }
        ]
      },
      %VariationGroup{
        id: :disabled,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:choice label="Choice A" value="a" disabled={true}/>|,
              ~s|<:choice label="Choice B" value="b" disabled={true} selected={true}/>|,
              ~s|<:choice label="Choice C" value="c"/>|
            ],
            attributes: %{
              title: "While the customer is checking out",
              allow_multiple: true,
              name: "checkout"
            }
          }
        ]
      },
      %VariationGroup{
        id: :filters,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:choice label="Enabled" value="enabled"/>|,
              ~s|<:choice label="Not invited" value="not invited" selected={true}/>|,
              ~s|<:choice label="Invited" value="invited" selected={true}/>|,
              ~s|<:choice label="Declined" value="declined"/>|
            ],
            attributes: %{
              title: "Account status",
              allow_multiple: true,
              name: "checkout"
            }
          }
        ]
      },
      %VariationGroup{
        id: :title_hidden,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:choice label="Enabled" value="enabled"/>|,
              ~s|<:choice label="Not invited" value="not invited" selected={true}/>|,
              ~s|<:choice label="Invited" value="invited" selected={true}/>|,
              ~s|<:choice label="Declined" value="declined"/>|
            ],
            attributes: %{
              title_hidden: true,
              title: "Account status",
              allow_multiple: true,
              name: "checkout"
            }
          }
        ]
      },
      %VariationGroup{
        id: :radio,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:choice label="Hidden" value="hidden"/>|,
              ~s|<:choice label="Optional" value="optional" selected={true}/>|,
              ~s|<:choice label="Required" value="required"/>|
            ],
            attributes: %{
              title: "Visibility",
              allow_multiple: false,
              name: "name"
            }
          }
        ]
      }
    ]
  end
end
