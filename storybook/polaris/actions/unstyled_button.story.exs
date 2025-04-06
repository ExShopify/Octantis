defmodule Storybook.Polaris.UnstyledButton do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.UnstyledButton.unstyled_button/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Add product|],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
