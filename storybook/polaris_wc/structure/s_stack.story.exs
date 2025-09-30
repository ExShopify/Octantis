defmodule Storybook.PolarisWC.SStackStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_stack/1

  def template do
    """
    <.stylesheet psb-code-hidden/>
    <.javascript psb-code-hidden/>

    <s-query-container>
      <s-box inlineSize="400px" blockSize="400px">
        <.psb-variation-group/>
      </s-box>
    </s-query-container>
    """
  end

  def imports,
    do: [
      {OctantisWeb.Components.Head, stylesheet: 1},
      {OctantisWeb.Components.Head, javascript: 1},
      {OctantisWeb.Components.PolarisWC.SIcon, s_icon: 1},
      {OctantisWeb.Storybook.Sigil, sigil_o: 2}
    ]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :inline,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{direction: "inline"}
          }
        ]
      },
      %VariationGroup{
        id: :block,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{direction: "block"}
          }
        ]
      },
      %VariationGroup{
        id: :responsive,
        variations: [
          %Variation{
            id: :small,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{direction: "@container (inline-size < 400px) block, inline"}
          },
          %Variation{
            id: :large,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{direction: "@container (inline-size >= 400px) block, inline"}
          }
        ]
      },
      %VariationGroup{
        id: :responsive_tuples,
        variations: [
          %Variation{
            id: :block,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{direction: {:responsive, {:<, "400px", "block", "inline"}}}
          },
          %Variation{
            id: :inline,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{direction: {:responsive, {:>=, "400px", "block", "inline"}}}
          }
        ]
      },
      %VariationGroup{
        id: :responsive_sigil,
        variations: [
          %Variation{
            id: :block,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{direction: {:eval, ~s|~o{"block" < "400px" < "inline"}r|}}
          },
          %Variation{
            id: :inline,
            slots: [
              ~S"""
              <s-badge icon="apps" tone="success">Item 1</s-badge>
              <s-badge icon="archive" tone="warning">Item 2</s-badge>
              <s-badge icon="automation" tone="critical">Item 3</s-badge>
              """
            ],
            attributes: %{direction: {:eval, ~s|~o{"inline" <= "400px" <= "block" }r|}}
          }
        ]
      }
    ]
  end
end
