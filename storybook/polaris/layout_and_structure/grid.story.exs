defmodule Storybook.Polaris.Grid do
  use PhoenixStorybook.Story, :component

  def imports do
    [
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Polaris.Grid, grid_cell: 1},
      {OctantisWeb.Components.Polaris.Card, card: 1}
    ]
  end

  def function, do: &OctantisWeb.Components.Polaris.Grid.grid/1

  def variations do
    [
      %VariationGroup{
        id: :two_column,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:grid_cell column_span={[xs: 6, sm: 3, md: 3, lg: 6, xl: 6]}>
                <.card>
                  <.text as="h2" variant="bodyMd">View a summary of your online store’s sales.</.text>
                </.card>
              </:grid_cell>
              <:grid_cell column_span={[xs: 6, sm: 3, md: 3, lg: 6, xl: 6]}>
                <.card>
                  <.text as="h2" variant="bodyMd">View a summary of your online store’s orders.</.text>
                </.card>
              </:grid_cell>
              """
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :two_third_and_one_third,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:grid_cell column_span={[xs: 6, sm: 4, md: 4, lg: 8, xl: 8]}>
                <.card>
                  <.text as="h2" variant="bodyMd">View a summary of your online store’s sales.</.text>
                </.card>
              </:grid_cell>
              <:grid_cell column_span={[xs: 6, sm: 2, md: 2, lg: 4, xl: 4]}>
                <.card>
                  <.text as="h2" variant="bodyMd">View a summary of your online store’s orders.</.text>
                </.card>
              </:grid_cell>
              """
            ],
            attributes: %{
              columns: [sm: 3]
            }
          }
        ]
      },
      %VariationGroup{
        id: :top_with_bottoms,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:grid_cell column_span={[xs: 6, sm: 6, md: 6, lg: 6, xl: 6]}>
                <.card>
                  <.text as="h2" variant="bodyMd">This is the main section</.text>
                </.card>
              </:grid_cell>
              <:grid_cell column_span={[xs: 6, sm: 3, md: 3, lg: 3, xl: 3]}>
                <.card>
                  <.text as="h2" variant="bodyMd">Docs</.text>
                </.card>
              </:grid_cell>
              <:grid_cell column_span={[xs: 6, sm: 3, md: 3, lg: 3, xl: 3]}>
                <.card>
                  <.text as="h2" variant="bodyMd">Contact Us</.text>
                </.card>
              </:grid_cell>
              """
            ],
            attributes: %{
              columns: [xs: 6, sm: 6, md: 6, lg: 6, xl: 6]
            }
          }
        ]
      }
    ]
  end
end
