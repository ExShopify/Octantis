defmodule Storybook.PolarisWC.STableStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_table/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:s_table_header>Name</:s_table_header>|,
              ~s|<:s_table_header>Email</:s_table_header>|,
              ~s|<:s_table_header>Phone</:s_table_header>|,
              ~s|<:s_table_cell :let={row}>{row.name}</:s_table_cell>|,
              ~s|<:s_table_cell :let={row}>{row.email}</:s_table_cell>|,
              ~s|<:s_table_cell :let={row}>{row.phone}</:s_table_cell>|
            ],
            attributes: %{
              rows: [
                %{
                  name: "John Doe",
                  email: "john.doe@example.com",
                  phone: "123-456-7890"
                },
                %{
                  name: "Jane Doe",
                  email: "jane.doe@example.com",
                  phone: "123-456-7890"
                },
                %{
                  name: "Brandon Doe",
                  email: "brandon.doe@example.com",
                  phone: "123-456-7890"
                }
              ]
            }
          }
        ]
      }
    ]
  end
end
