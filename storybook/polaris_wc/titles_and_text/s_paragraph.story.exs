defmodule Storybook.PolarisWC.SParagraphStory do
  use OctantisWeb.Storybook.Story, :web_component

  def function, do: &OctantisWeb.Components.Polaris.s_paragraph/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              Shopify POS is the easiest way to sell your products in person. Available for
                iPad, iPhone, and Android.
              """
            ],
            attributes: %{}
          }
        ]
      }
    ]
  end
end
