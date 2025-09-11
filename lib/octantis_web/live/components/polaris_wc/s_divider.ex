defmodule OctantisWeb.Components.PolarisWC.SDivider do
  @moduledoc """
  Create clear visual separation between elements in your user interface.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/divider
  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.PolarisWC.Types

  @doc @moduledoc

  attr :color, :string,
    values: Types.colours(),
    doc: ~S"""
    Modify the color to be more or less intense.
    """

  attr :direction, :string,
    values: ["inline", "block"],
    doc: ~S"""
    Specify the direction of the divider.

    An 'inline' divider separates blocks of content. In a left-to-right or right-to-left writing mode, this would typically be a horizontal line.

    A 'block' divider separates items within the current line of content. In a left-to-right or right-to-left writing mode, this would typically be a vertical line.
    """

  @attributes [{:color, :string}, {:direction, :string}] |> Map.new()
  def s_divider(assigns) do
    assigns = assigns |> assign_attrs(@attributes)

    ~H"""
    <s-divider {@attrs}></s-divider>
    """
  end
end
