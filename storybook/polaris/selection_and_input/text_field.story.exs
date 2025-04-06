defmodule Storybook.Polaris.TextField do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.TextField.text_field/1

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Select, select: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  @field Phoenix.Component.to_form(%{"value" => ""})[:value]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Search", field: @field}
          }
        ]
      },
      %VariationGroup{
        id: :disabled,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Search", disabled: true, field: @field}
          }
        ]
      },
      %VariationGroup{
        id: :with_placeholder_text,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Search", placeholder: "Search sections", field: @field}
          }
        ]
      },
      %VariationGroup{
        id: :with_hidden_label,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Search", label_hidden: true, field: @field}
          }
        ]
      },
      %VariationGroup{
        id: :with_loading,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Search", loading: true, field: @field}
          }
        ]
      },
      %VariationGroup{
        id: :with_prefix,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{label: "Search", prefix: "$", field: @field}
          }
        ]
      },
      %VariationGroup{
        id: :with_left_connected,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|<:connected_left>
              <.select  id="WithLeftConnectedSelect"
                        label="Weight unit"
                        label_hidden={true}
                        options={["kg", "lb"]}
                        field={Phoenix.Component.to_form(%{"value" => ""})[:value]}
                      />
              </:connected_left>|],
            attributes: %{label: "Search", field: @field}
          }
        ]
      }
    ]
  end
end
