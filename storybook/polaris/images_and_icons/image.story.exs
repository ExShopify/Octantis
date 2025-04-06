defmodule Storybook.Polaris.Image do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Image.image/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            attributes: %{
              source: "/images/relax.svg",
              alt: "Nothing here yet"
            }
          }
        ]
      }
    ]
  end
end
