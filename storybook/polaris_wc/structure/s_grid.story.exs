defmodule Storybook.PolarisWC.SGrid do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_grid/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:s_grid_item grid_column="span 2" border="base" border_style="dashed">
                Summary of sales
              </:s_grid_item>
              """,
              ~s"""
              <:s_grid_item grid_column="span 1" border="base" border_style="dashed">
                Orders
              </:s_grid_item>
              """,
              ~s"""
              <:s_grid_item grid_column="auto" border="base" border_style="dashed">
                Customers
              </:s_grid_item>
              """
            ],
            attributes: %{
              grid_template_columns: "repeat(2, 1fr)",
              gap: "small",
              justify_content: "center"
            }
          }
        ]
      }
    ]
  end
end
