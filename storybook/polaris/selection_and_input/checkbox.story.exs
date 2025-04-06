defmodule Storybook.Polaris.Checkbox do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Checkbox.checkbox/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Basic checkbox", name: "checkbox"}
          }
        ]
      },
      %VariationGroup{
        id: :checked,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Basic checkbox", name: "checkbox", checked: true}
          }
        ]
      },
      %VariationGroup{
        id: :disabled,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Basic checkbox", name: "checkbox", disabled: true}
          }
        ]
      }
    ]
  end
end
