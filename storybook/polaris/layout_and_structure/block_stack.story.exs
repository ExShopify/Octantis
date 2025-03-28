defmodule Storybook.Polaris.BlockStack do
  use PhoenixStorybook.Story, :component

  def imports, do: [{OctantisWeb.Components.Polaris.Text, text: 1}]

  def function, do: &OctantisWeb.Components.Polaris.BlockStack.block_stack/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :gap,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{gap: [xs: "500"]}
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
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{align: "start"}
          },
          %Variation{
            id: :center,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >center</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{align: "center"}
          },
          %Variation{
            id: :end,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >end</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{align: "end"}
          }
        ]
      },
      %VariationGroup{
        id: :inline_align,
        variations: [
          %Variation{
            id: :start,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >Start</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{inline_align: "start"}
          },
          %Variation{
            id: :center,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >center</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{inline_align: "center"}
          },
          %Variation{
            id: :end,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >end</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" />
              |],
            attributes: %{inline_align: "end"}
          }
        ]
      }
    ]
  end
end
