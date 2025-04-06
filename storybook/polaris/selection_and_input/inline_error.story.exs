defmodule Storybook.Polaris.InlineError do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.InlineError.inline_error/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{message: "Store name is required", field_id: "myFieldID"}
          }
        ]
      }
    ]
  end
end
