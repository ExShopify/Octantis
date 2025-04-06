defmodule Storybook.Polaris.InlineStack do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Polaris.BlockStack, block_stack: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def function, do: &OctantisWeb.Components.Polaris.InlineStack.inline_stack/1

  def variations do
    [
      %VariationGroup{
        id: :nonwrapping,
        variations: [
          %Variation{
            id: :gap,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{wrap: false}
          }
        ]
      },
      %VariationGroup{
        id: :gap,
        variations: [
          %Variation{
            id: :gap,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{gap: [xs: "400"], wrap: false, block_align: "center"}
          }
        ]
      },
      %VariationGroup{
        id: :block_align,
        variations: [
          %Variation{
            id: :start,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >Start</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{block_align: "start"}
          },
          %Variation{
            id: :center,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >center</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{block_align: "center"}
          },
          %Variation{
            id: :end,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >end</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{block_align: "end"}
          },
          %Variation{
            id: :baseline,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >baseline</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{block_align: "baseline"}
          },
          %Variation{
            id: :stretch,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >stretch</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{block_align: "stretch"}
          }
        ]
      },
      %VariationGroup{
        id: :align,
        variations: [
          %Variation{
            id: :start,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >Start</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{align: "start"}
          },
          %Variation{
            id: :center,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >center</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{align: "center"}
          },
          %Variation{
            id: :end,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >end</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{align: "end"}
          }
        ]
      }
    ]
  end
end
