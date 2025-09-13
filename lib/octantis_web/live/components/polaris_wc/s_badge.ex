defmodule OctantisWeb.Components.PolarisWC.SBadge do
  @moduledoc """
  Inform users about the status of an object or indicate that an action has been completed.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/titles-and-text/badge
  """

  use OctantisWeb.Core, :web_component

  s_attr :color, :color, doc: "Modify the color to be more or less intense."

  s_attr :icon, :icon, doc: "The type of icon to be displayed in the badge."

  s_attr :size, :string, values: ["base", "large", "large-100"], doc: "Adjusts the size."

  s_attr :tone, :tone,
    doc: "Sets the tone of the Badge, based on the intention of the information being conveyed."

  slot :inner_block

  @doc @moduledoc

  def s_badge(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-badge {@s_attrs}>{render_slot(@inner_block)}</s-badge>
    """
  end
end
