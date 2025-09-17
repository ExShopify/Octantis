defmodule OctantisWeb.Components.PolarisWC.SMenu do
  @moduledoc """
  Use Menu to display a list of actions that can be performed on a resource.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/actions/menu
  """

  use OctantisWeb.Core, :web_component

  s_attr :id, :string

  s_attr :accessibility_label, :string,
    doc: ~S"""
    A label that describes the purpose or contents of the element. When set, it will be announced using assistive technologies and provide additional context.
    """

  slot :inner_block

  def s_menu(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-menu {@s_attrs}>{render_slot(@inner_block)}</s-menu>
    """
  end
end
