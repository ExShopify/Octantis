defmodule Storybook.PolarisWC.SImageStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_image/1

  def variations do
    [
      %VariationGroup{
        id: :info,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{
              src: "https://cdn.shopify.com/static/images/polaris/image-wc_src.png",
              alt: "Four pixelated characters ready to build amazing Shopify apps",
              aspect_ratio: "59/161",
              inline_size: "auto"
            }
          }
        ]
      }
    ]
  end
end
