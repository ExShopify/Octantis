defmodule Storybook.Polaris.Banner do
  use OctantisWeb.Storybook.Story, :component

  alias OctantisWeb.Components.Polaris.Banner
  alias OctantisWeb.Components.Polaris.Icons

  def function, do: &OctantisWeb.Components.Polaris.Banner.banner/1

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|],
            attributes: %{}
          }
        ]
      },
      %VariationGroup{
        id: :with_title,
        variations: [
          %Variation{
            id: :default,
            slots: [],
            attributes: %{title: "Title"}
          }
        ]
      },
      %VariationGroup{
        id: :with_title_and_content,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|],
            attributes: %{title: "Title"}
          }
        ]
      },
      %VariationGroup{
        id: :dismissable,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|],
            attributes: %{title: "Title", on_dismiss: Banner.hide("banner-dismissable-default")}
          }
        ]
      },
      %VariationGroup{
        id: :without_title,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Section installed to Dawn (Live)|],
            attributes: %{tone: "success"}
          }
        ]
      },
      %VariationGroup{
        id: :without_title_dismissable,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Section installed to Dawn (Live)|],
            attributes: %{
              tone: "success",
              on_dismiss: Banner.hide("banner-without-title-dismissable-default")
            }
          }
        ]
      },
      %VariationGroup{
        id: :within_container,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Section installed to Dawn (Live)|],
            attributes: %{within_container: true, tone: "success"}
          }
        ]
      },
      %VariationGroup{
        id: :within_container_warning,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Section installed to Dawn (Live)|],
            attributes: %{within_container: true, tone: "warning"}
          }
        ]
      },
      %VariationGroup{
        id: :within_container_dismissable,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Section installed to Dawn (Live)|],
            attributes: %{
              within_container: true,
              tone: "warning",
              on_dismiss: Banner.hide("banner-within-container-dismissable-default")
            }
          }
        ]
      },
      %VariationGroup{
        id: :upgrade_to_unlock,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Upgrade your plan to unlock this and all other Premium Sections.|,
              ~s|<:action content="Upgrade to Premium" variant="primary"/>|
            ],
            attributes: %{
              title: "Upgrade to unlock",
              icon: &Icons.lock/1,
              within_container: true,
              tone: "warning"
            }
          }
        ]
      }
    ]
  end
end
