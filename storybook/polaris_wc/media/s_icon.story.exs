defmodule Storybook.PolarisWC.SIconStory do
  use OctantisWeb.Storybook.Story, :web_component

  alias OctantisWeb.Components.PolarisWC.Types

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
      },
      %VariationGroup{
        id: :types,
        variations:
          for type <- Types.icons() do
            %Variation{
              id: String.to_atom("base_base_info_" <> type),
              slots: [],
              attributes: %{type: type, color: "base", size: "base", tone: "info"}
            }
          end
      }
    ]
  end
end
