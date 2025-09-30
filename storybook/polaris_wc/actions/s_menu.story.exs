defmodule Storybook.PolarisWC.SPopoverStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_menu/1

  def template do
    """
    <.stylesheet psb-code-hidden/>
    <.javascript psb-code-hidden/>

    <.s_button id=":variation_id-default_activator" command_for=":variation_id-default">Open</.s_button>

    <.psb-variation-group/>

    """
  end

  def imports,
    do: [
      {OctantisWeb.Components.Head, stylesheet: 1},
      {OctantisWeb.Components.Head, javascript: 1},
      {OctantisWeb.Components.Polaris, s_button: 1},
      {OctantisWeb.Storybook.Sigil, sigil_o: 2}
    ]

  def aliases, do: [Phoenix.LiveView.JS]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"""
              <.s_button variant="tertiary">Import</.s_button>
              <.s_button variant="tertiary">Export</.s_button>
              """
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :complex_event,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"""
              <.s_button
                variant="tertiary"
                click={
                  JS.dispatch("click", to: "#s-popover-story-complex-event-default_activator")
                  |> JS.push("trigge_event")
                }
                data-phx-value-dispatch-id="my-id"
              >
                Trigger Event and close
              </.s_button>
              """
            ],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
