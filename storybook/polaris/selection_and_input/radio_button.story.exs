defmodule Storybook.Polaris.RadioButton do
  use OctantisWeb.Storybook.Story, :component

  def function, do: &OctantisWeb.Components.Polaris.RadioButton.radio_button/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              label: "Accounts are disabled",
              help_text: "Customers will only be able to check out as guests.",
              checked: false,
              name: "accounts"
            }
          },
          %Variation{
            id: :checked,
            slots: [],
            attributes: %{
              label: "Accounts are optional",
              help_text:
                "Customers will be able to check out with a customer account or as a guest.",
              checked: true,
              name: "accounts"
            }
          }
        ]
      },
      %VariationGroup{
        id: :magic,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              label: "Magic",
              help_text: "Magic Option",
              checked: true,
              name: "magic",
              tone: "magic"
            }
          },
          %Variation{
            id: :uncheck,
            slots: [],
            attributes: %{
              label: "Unckecked Magic",
              help_text: "Uncheck Magic",
              checked: false,
              name: "magic",
              tone: "magic"
            }
          }
        ]
      }
    ]
  end
end
