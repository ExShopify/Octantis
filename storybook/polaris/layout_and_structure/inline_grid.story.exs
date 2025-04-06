defmodule Storybook.Polaris.InlineGrid do
  use OctantisWeb.Storybook.Story, :component

  def imports do
    [
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Polaris.Card, card: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]
  end

  def function, do: &OctantisWeb.Components.Polaris.InlineGrid.inline_grid/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              |],
            attributes: %{columns: [xs: 2]}
          }
        ]
      },
      %VariationGroup{
        id: :gap,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              |],
            attributes: %{columns: [xs: 2], gap: [xs: "400"]}
          }
        ]
      },
      %VariationGroup{
        id: :align_items,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              |],
            attributes: %{columns: [xs: 2], gap: [xs: "400"], align_items: "center"}
          }
        ]
      },
      %VariationGroup{
        id: :column_width,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:36px" >section</div>
              <div style="background:var(--p-color-text-info);padding:14px var(--p-space-200);height:48px" >section</div>
              |],
            attributes: %{columns: [xs: 1, md: "2fr 1fr"], gap: [xs: "100"]}
          }
        ]
      }
    ]
  end
end
