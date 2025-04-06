defmodule Storybook.Polaris.Tabs do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Tabs.tabs/1

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Box, box: 1},
      {OctantisWeb.Components.Polaris.Card, card: 1},
      {OctantisWeb.Components.Polaris.Image, image: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def template do
    """
    <.stylesheet psb-code-hidden/>
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
              <:tab
                content="All"
                accessibility_label="All customers"
              >
                <.box padding={[md: "200"]}>All Customers</.box>
              </:tab>
              """,
              ~s"""
              <:tab
                content="Accepts marketing"
              >
                <.box padding={[md: "200"]}>Accepts marketing</.box>
              </:tab>
              """,
              ~s"""
              <:tab
                content="Repeat customers"
                accessibility_label="Repeat customers"
              >
                <.box padding={[md: "200"]}>Repeat customers</.box>
              </:tab>
              """,
              ~s"""
              <:tab
                content="Prospects"
              >
                <.box padding={[md: "200"]}>Prospects</.box>
              </:tab>
              """
            ],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :images,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <:tab
                image_source="https://picsum.photos/45"
                accessibility_label="All customers"
              >
                <.box padding={[md: "200"]}><.image source="https://picsum.photos/250"/></.box>
              </:tab>
              """,
              ~s"""
              <:tab
                image_source="https://picsum.photos/50"
                accessibility_label="Accepts marketing"
              >
                <.box padding={[md: "200"]}><.image source="https://picsum.photos/300"/></.box>
              </:tab>
              """,
              ~s"""
              <:tab
                image_source="https://picsum.photos/500/600"
                accessibility_label="Repeat customers"
              >
                <.box padding={[md: "200"]}><.image source="https://picsum.photos/500/600"/></.box>
              </:tab>
              """,
              ~s"""
              <:tab
                image_source="https://picsum.photos/600/500"
                accessibility_label="Prospects"
              >
                <.box padding={[md: "200"]}><.image source="https://picsum.photos/600/500"/></.box>
              </:tab>
              """
            ],
            attributes: %{bottom_tabs: true, icon: true, inline_align: "center"}
          }
        ]
      }
    ]
  end
end
