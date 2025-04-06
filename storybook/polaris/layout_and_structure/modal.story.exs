defmodule Storybook.Polaris.Modal do
  use OctantisWeb.Storybook.Story, :component

  def imports,
    do: [
      {OctantisWeb.Components.Polaris.Button, button: 1},
      {OctantisWeb.Components.Head, stylesheet: 1}
    ]

  def aliases, do: [OctantisWeb.Components.Polaris.Icons]

  def function, do: &OctantisWeb.Components.Polaris.Modal.modal/1

  def template do
    """
    <.stylesheet psb-code-hidden/>
    <div class="my-custom-wrapper" psb-code-hidden>
      <.button phx_click={Modal.show(":variation_id")} >Open modal</.button>
      <.psb-variation/>
    </div>
    """
  end

  def container, do: {:iframe, style: "height: 600px; width: 600px"}

  def variations do
    [
      %VariationGroup{
        id: :default,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :success,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", tone: "success", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :info,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", tone: "info", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :warning,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", tone: "warning", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :critical,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", tone: "critical", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :actions,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|Content|,
              ~s|<:action content="Ok" />|,
              ~s|<:secondary_action content="Secondary"/>|,
              ~s|<:secondary_action content="Something Else Entirely" icon={&Icons.external_small/1} />|
            ],
            attributes: %{title: "My Modal", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :title_hidden,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", title_hidden: true, open: true}
          }
        ]
      },
      %VariationGroup{
        id: :loading,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", loading: true, open: true}
          }
        ]
      },
      %VariationGroup{
        id: :large,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", size: "large", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :small,
        variations: [
          %Variation{
            id: :default,
            slots: [~s|Content|, ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", size: "small", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :full_screen,
        variations: [
          %Variation{
            id: :default,
            slots: [
              ~s|This is only full screen on a smaller viewport|,
              ~s|<:action content="Ok"/>|
            ],
            attributes: %{title: "My Modal", size: "fullScreen", open: true}
          }
        ]
      },
      %VariationGroup{
        id: :huge_content,
        variations: [
          %Variation{
            id: :default,
            slots: [lorem_ipsum(), ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", no_scroll: true, open: true}
          }
        ]
      },
      %VariationGroup{
        id: :limit_height,
        variations: [
          %Variation{
            id: :default,
            slots: [lorem_ipsum(), ~s|<:action content="Ok"/>|],
            attributes: %{title: "My Modal", limit_height: true, open: true}
          }
        ]
      }
    ]
  end

  @lorem_ipsum """
  Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.
  """

  defp lorem_ipsum, do: Enum.map_join(1..10, "\n", fn _ -> @lorem_ipsum end)
end
