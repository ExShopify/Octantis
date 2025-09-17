defmodule OctantisWeb.Components.PolarisWC.SDivider do
  @moduledoc """
  Create clear visual separation between elements in your user interface.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/divider
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  s_attr :color, :color,
    doc: ~S"""
    Modify the color to be more or less intense.
    """

  s_attr :direction, :direction,
    doc: ~S"""
    Specify the direction of the divider.

    An 'inline' divider separates blocks of content. In a left-to-right or right-to-left writing mode, this would typically be a horizontal line.

    A 'block' divider separates items within the current line of content. In a left-to-right or right-to-left writing mode, this would typically be a vertical line.
    """

  attr :rest, :global

  def s_divider(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-divider {@s_attrs} {@rest}></s-divider>
    """
  end
end
