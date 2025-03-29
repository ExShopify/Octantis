defmodule Storybook.Polaris.Banner do
  use PhoenixStorybook.Story, :component

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
