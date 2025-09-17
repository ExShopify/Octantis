defmodule Storybook.PolarisWC.SIconStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_icon/1

  def variations do
    [
      %VariationGroup{
        id: :info,
        variations:
          for color <- ["base", "subdued"],
              size <- ["small", "base"],
              tone <- ["info", "success", "warning", "critical", "auto", "neutral", "caution"] do
            %Variation{
              id: String.to_atom(color <> "_" <> size <> "_" <> tone),
              slots: [],
              attributes: %{type: "info", color: color, size: size, tone: tone}
            }
          end
      }
    ]
  end
end
