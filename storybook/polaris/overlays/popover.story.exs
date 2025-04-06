defmodule Storybook.Polaris.Popover do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Popover.popover/1

  def imports do
    [
      {OctantisWeb.Components.Polaris.ComplexAction, complex_action: 1},
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
      }
    ]
  end
end
