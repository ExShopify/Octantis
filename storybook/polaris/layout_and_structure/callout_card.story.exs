defmodule Storybook.Polaris.CalloutCard do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def function, do: &OctantisWeb.Components.Polaris.CalloutCard.callout_card/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<p>Upload your store’s logo, change colors and fonts, and more.</p>|,
              ~s|<:primary_action content="Customize checkout" url="#" />|
            ],
            attributes: %{
              title: "Customize the style of your checkout",
              illustration:
                "https://cdn.shopify.com/s/assets/admin/checkout/settings-customizecart-705f57c725ac05be5a34ec20c05b94298cb8afd10aac7bd9c7ad02030f48cfa0.svg"
            }
          }
        ]
      },
      %VariationGroup{
        id: :secondary_action,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<p>Upload your store’s logo, change colors and fonts, and more.</p>|,
              ~s|<:primary_action content="Customize checkout" url="#" />|,
              ~s|<:secondary_action content="Learn more about customizing checkout" url="#" />|
            ],
            attributes: %{
              title: "Customize the style of your checkout",
              illustration:
                "https://cdn.shopify.com/s/assets/admin/checkout/settings-customizecart-705f57c725ac05be5a34ec20c05b94298cb8afd10aac7bd9c7ad02030f48cfa0.svg"
            }
          }
        ]
      },
      %VariationGroup{
        id: :without_illustration,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<p>Upload your store’s logo, change colors and fonts, and more.</p>|,
              ~s|<:primary_action content="Customize checkout" url="#" />|,
              ~s|<:secondary_action content="Learn more about customizing checkout" url="#" />|
            ],
            attributes: %{
              title: "Customize the style of your checkout"
            }
          }
        ]
      }
    ]
  end
end
