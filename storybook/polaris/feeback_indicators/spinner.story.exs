defmodule Storybook.Polaris.Spinner do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Spinner.spinner/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            attributes: %{
              accessibility_label: "Spinner example",
              size: "large"
            }
          },
          %Variation{
            id: :small,
            attributes: %{
              accessibility_label: "Small spinner example",
              size: "small"
            }
          }
        ]
      }
    ]
  end
end
