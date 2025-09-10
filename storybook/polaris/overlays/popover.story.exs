defmodule Storybook.Polaris.Popover do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Popover.popover/1

  def imports do
    [
      {OctantisWeb.Components.Polaris.Card, card: 1},
      {OctantisWeb.Components.Polaris.ComplexAction, complex_action: 1},
      {OctantisWeb.Components.Polaris.IndexTable, index_table: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]
  end

  def aliases, do: [OctantisWeb.Components.Polaris.Icons]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:activator :let={activator}>
                <.complex_action
                  content="More Actions"
                  variant="primary"
                  tone="critical"
                  full_width={true}
                  icon={&Icons.caret_down/1}
                  phx_click={activator.phx_click}
                />
              </:activator>
              """,
              ~s|<:action content="Import"/>|,
              ~s|<:action content="Export"/>|
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :inside_card,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:activator :let={activator}>
                <.complex_action
                  content="More Actions"
                  variant="primary"
                  tone="critical"
                  full_width={true}
                  icon={&Icons.caret_down/1}
                  phx_click={activator.phx_click}
                />
              </:activator>
              """,
              ~s|<:action content="Import"/>|,
              ~s|<:action content="Export"/>|
            ],
            attributes: %{}
          }
        ],
        template: ~s"""
        <div style="position:relative">
          <.card shadow_bevel={%{position: "static"}}>
            <.psb-variation-group/>
          </.card>
        </div>
        """
      },
      %VariationGroup{
        id: :inside_card_left,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:activator :let={activator}>
                <.complex_action
                  content="More Actions"
                  variant="primary"
                  tone="critical"
                  full_width={true}
                  icon={&Icons.caret_down/1}
                  phx_click={activator.phx_click}
                />
              </:activator>
              """,
              ~s|<:action content="Import"/>|,
              ~s|<:action content="Export"/>|,
              ~s|<:overlay right="calc(100% - var(--p-space-600))"/>|
            ],
            attributes: %{}
          }
        ],
        template: ~s"""
        <div style="position:relative">
          <.card shadow_bevel={%{position: "static"}}>
            <.psb-variation-group/>
          </.card>
        </div>
        """
      },
      %VariationGroup{
        id: :inside_index_table,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:activator :let={activator}>
                <.complex_action
                  phx_click={activator.phx_click}
                  variant="plain"
                  icon={&Icons.menu_horizontal/1}
                />
              </:activator>
              """,
              ~s|<:action content="Import"/>|,
              ~s|<:action content="Export"/>|
            ],
            attributes: %{}
          }
        ],
        template: ~s"""
        <div style="position:relative">
          <.card shadow_bevel={%{position: "static"}} padding={[xs: "0"]}>
            <.index_table
              id="tableid"
              selectable={Phoenix.LiveView.AsyncResult.loading()}
              rows={[%{id: "1", value: "Some val"}]}
              position="static"
            >
              <:col :let={row} header="Value">
                {row.value}
              </:col>
              <:col header="Actions" display="flex" justify_content="flex-end">
                <.psb-variation-group/>
              </:col>
            </.index_table>
          </.card>
        </div>
        """
      },
      %VariationGroup{
        id: :inside_index_table_left,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:activator :let={activator}>
                <.complex_action
                  phx_click={activator.phx_click}
                  variant="plain"
                  icon={&Icons.menu_horizontal/1}
                />
              </:activator>
              """,
              ~s|<:action content="Import"/>|,
              ~s|<:action content="Export"/>|,
              ~s|<:overlay right="calc(var(--p-space-800))" />|
            ],
            attributes: %{}
          }
        ],
        template: ~s"""
        <div style="position:relative">
          <.card shadow_bevel={%{position: "static"}} padding={[xs: "0"]}>
            <.index_table
              id="tableid"
              selectable={Phoenix.LiveView.AsyncResult.loading()}
              rows={[%{id: "1", value: "Some val"}]}
              position="static"
            >
              <:col :let={row} header="Value">
                {row.value}
              </:col>
              <:col header="Actions" display="flex" justify_content="flex-end">
                <.psb-variation-group/>
              </:col>
            </.index_table>
          </.card>
        </div>
        """
      }
    ]
  end
end
