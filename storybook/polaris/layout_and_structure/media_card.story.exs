defmodule Storybook.Polaris.MediaCard do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Text, text: 1},
      {OctantisWeb.Components.Polaris.SkeletonBodyText, skeleton_body_text: 1},
      {OctantisWeb.Components.Polaris.SkeletonDisplayText, skeleton_display_text: 1},
      {OctantisWeb.Components.Polaris.SkeletonThumbnail, skeleton_thumbnail: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def function, do: &OctantisWeb.Components.Polaris.MediaCard.media_card/1

  def aliases, do: [OctantisWeb.Components.Polaris.Icons]

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:description>description</:description>|,
              ~s"""
              <img
                alt=""
                width="100%"
                height="100%"
                style="object-fit:cover;object-position:center"
                src="https://burst.shopifycdn.com/photos/business-woman-smiling-in-office.jpg?width=1850"
              />
              """,
              ~s|<:primary_action content="Add transfer" />|,
              ~s|<:secondary_action content="Learn more" />|
            ],
            attributes: %{title: "title"}
          }
        ]
      },
      %VariationGroup{
        id: :portrait,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:description>description</:description>|,
              ~s"""
              <img
                alt=""
                width="100%"
                height="100%"
                style="object-fit:cover;object-position:center"
                src="https://burst.shopifycdn.com/photos/business-woman-smiling-in-office.jpg?width=1850"
              />
              """
            ],
            attributes: %{portrait: true, title: "title"}
          }
        ]
      },
      %VariationGroup{
        id: :small_portrait,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:description>description</:description>|,
              ~s"""
              <img
                alt=""
                width="100%"
                height="100%"
                style="object-fit:cover;object-position:center"
                src="https://burst.shopifycdn.com/photos/business-woman-smiling-in-office.jpg?width=1850"
              />
              """,
              ~s|<:primary_action content="Add transfer" />|,
              ~s|<:secondary_action content="Learn more" />|
            ],
            attributes: %{
              portrait: true,
              size: "small",
              title: "title"
            }
          }
        ]
      },
      %VariationGroup{
        id: :icon_button,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|<:description>description</:description>|,
              ~s"""
              <img
                alt=""
                width="100%"
                height="100%"
                style="object-fit:cover;object-position:center"
                src="https://burst.shopifycdn.com/photos/business-woman-smiling-in-office.jpg?width=1850"
              />
              """,
              ~s|<:primary_action content="Add transfer" />|,
              ~s|<:secondary_action content="Learn more" icon={&Icons.arrow_right/1} />|
            ],
            attributes: %{
              portrait: true,
              size: "small",
              title: "title"
            }
          }
        ]
      },
      %VariationGroup{
        id: :card_skeleton,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s"""
              <img
                alt=""
                width="100%"
                height="100%"
                style="object-fit:cover;object-position:center"
                src="https://burst.shopifycdn.com/photos/business-woman-smiling-in-office.jpg?width=1850"
              />
              """,
              ~s|<:description><.skeleton_body_text /></:description>|,
              ~s|<:title flex_grow="1"><.skeleton_display_text size="medium" /></:title>|
            ],
            attributes: %{portrait: true}
          }
        ]
      }
    ]
  end
end
