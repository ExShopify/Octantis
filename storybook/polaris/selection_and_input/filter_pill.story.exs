defmodule Storybook.Polaris.FilterPill do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Filters.filter_pill/1

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.ChoiceList, choice_list: 1},
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
              ~s"""
              <:filter>
                <.choice_list name="default" title="Account status" title_hidden allow_multiple>
                  <:choice label="Enabled" value="enabled"/>
                  <:choice label="Not invited" value="not invited" selected={true}/>
                  <:choice label="Invited" value="invited" selected={true}/>
                  <:choice label="Declined" value="declined"/>
                </.choice_list>
              </:filter>
              """
            ],
            attributes: %{
              hide_query_field: true,
              initial_active: true,
              label: "some filter",
              filter_key: "default",
              hide_clear_button: true
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
              ~s"""
              <:filter>
                <.choice_list name="selected" title="Account status" title_hidden allow_multiple>
                  <:choice label="Enabled" value="enabled"/>
                  <:choice label="Not invited" value="not invited" selected={true}/>
                  <:choice label="Invited" value="invited" selected={true}/>
                  <:choice label="Declined" value="declined"/>
                </.choice_list>
              </:filter>
              """
            ],
            attributes: %{
              hide_query_field: true,
              initial_active: true,
              label: "some filter",
              filter_key: "selected",
              hide_clear_button: true,
              selected: true
            }
          }
        ]
      }
    ]
  end
end
