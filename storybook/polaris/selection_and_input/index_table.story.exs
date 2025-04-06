defmodule Storybook.Polaris.IndexTable do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Polaris.Card, card: 1},
      {OctantisWeb.Components.Polaris.Image, image: 1},
      {OctantisWeb.Components.Polaris.IndexTable, index_table_row: 1},
      {OctantisWeb.Components.Polaris.IndexTable, index_table_cell: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def function, do: &OctantisWeb.Components.Polaris.IndexTable.index_table/1

  def template do
    """
    <.card padding={[xs: "0"]}>
      <.psb-variation/>
    </.card>
    """
  end

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:col><.image source="/images/relax.svg" alt="section" style="max-width:50px;max-hight:50px;"/></:col>
              <:col header="Sections" :let={row}>
              <%= row.section %>
              </:col>
              <:col header="State" :let={row}><%= row.state %></:col>
              """
            ],
            attributes: %{
              selectable: false,
              rows: [%{section: "some section", state: "some_state", id: "someid"}]
            }
          }
        ]
      },
      %VariationGroup{
        id: :medium_data,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:col header="Order" :let={order}><%= order.order %></:col>
              <:col header="Date" :let={order}><%= order.date %></:col>
              <:col header="Customer" :let={order}><%= order.customer %></:col>
              <:col header={{"Total", []}} :let={order}><%= order.total %></:col>
              """
            ],
            attributes: %{
              selectable: false,
              rows: [
                %{
                  id: "1020",
                  order: "#1020",
                  date: "Jul 20 at 4:34pm",
                  customer: "Jaydon Stanton",
                  total: "$969.44"
                },
                %{
                  id: "1019",
                  order: "#1019",
                  date: "Jul 20 at 3:46pm",
                  customer: "Ruben Westerfelt",
                  total: "$701.19"
                },
                %{
                  id: "1018",
                  order: "#1018",
                  date: "Jul 20 at 3.44pm",
                  customer: "Leo Carder",
                  total: "$798.24"
                }
              ]
            }
          }
        ]
      },
      %VariationGroup{
        id: :selectable,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:col header="Order" :let={order}><%= order.order %></:col>
              <:col header="Date" :let={order}><%= order.date %></:col>
              <:col header="Customer" :let={order}><%= order.customer %></:col>
              <:col header={{"Total", []}} :let={order}><%= order.total %></:col>
              """
            ],
            attributes: %{
              selectable: true,
              rows: [
                %{
                  id: "1020",
                  order: "#1020",
                  date: "Jul 20 at 4:34pm",
                  customer: "Jaydon Stanton",
                  total: "$969.44"
                },
                %{
                  id: "1019",
                  order: "#1019",
                  date: "Jul 20 at 3:46pm",
                  customer: "Ruben Westerfelt",
                  total: "$701.19"
                },
                %{
                  id: "1018",
                  order: "#1018",
                  date: "Jul 20 at 3.44pm",
                  customer: "Leo Carder",
                  total: "$798.24"
                }
              ]
            }
          }
        ]
      },
      %VariationGroup{
        id: :partially_selected,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:col header="Order" :let={order}><%= order.order %></:col>
              <:col header="Date" :let={order}><%= order.date %></:col>
              <:col header="Customer" :let={order}><%= order.customer %></:col>
              <:col header={{"Total", []}} :let={order}><%= order.total %></:col>
              """
            ],
            attributes: %{
              selectable: true,
              selected: %{
                "1020" => "true",
                "1019" => "false",
                "1018" => "false"
              },
              rows: [
                %{
                  id: "1020",
                  order: "#1020",
                  date: "Jul 20 at 4:34pm",
                  customer: "Jaydon Stanton",
                  total: "$969.44"
                },
                %{
                  id: "1019",
                  order: "#1019",
                  date: "Jul 20 at 3:46pm",
                  customer: "Ruben Westerfelt",
                  total: "$701.19"
                },
                %{
                  id: "1018",
                  order: "#1018",
                  date: "Jul 20 at 3.44pm",
                  customer: "Leo Carder",
                  total: "$798.24"
                }
              ]
            }
          }
        ]
      },
      %VariationGroup{
        id: :all_selected,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:col header="Order" :let={order}><%= order.order %></:col>
              <:col header="Date" :let={order}><%= order.date %></:col>
              <:col header="Customer" :let={order}><%= order.customer %></:col>
              <:col header={{"Total", []}} :let={order}><%= order.total %></:col>
              """
            ],
            attributes: %{
              selectable: true,
              selected: %{
                "1020" => "true",
                "1019" => "true",
                "1018" => "true"
              },
              rows: [
                %{
                  id: "1020",
                  order: "#1020",
                  date: "Jul 20 at 4:34pm",
                  customer: "Jaydon Stanton",
                  total: "$969.44"
                },
                %{
                  id: "1019",
                  order: "#1019",
                  date: "Jul 20 at 3:46pm",
                  customer: "Ruben Westerfelt",
                  total: "$701.19"
                },
                %{
                  id: "1018",
                  order: "#1018",
                  date: "Jul 20 at 3.44pm",
                  customer: "Leo Carder",
                  total: "$798.24"
                }
              ]
            }
          }
        ]
      }
    ]
  end
end
