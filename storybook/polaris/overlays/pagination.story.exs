defmodule Storybook.Polaris.Pagination do
  use PhoenixStorybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.Pagination.pagination/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "1-10"}
          }
        ]
      },
      %VariationGroup{
        id: :has_next,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "1-10", has_next: true}
          }
        ]
      },
      %VariationGroup{
        id: :has_previous,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "1-10", has_previous: true}
          }
        ]
      },
      %VariationGroup{
        id: :has_both,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "1-10", has_next: true, has_previous: true}
          }
        ]
      },
      %VariationGroup{
        id: :no_lagel,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{has_next: true, has_previous: true}
          }
        ]
      }
    ]
  end
end
