defmodule OctantisWeb.Components.PolarisWC.SIcon do
  @moduledoc """
  Renders a graphic symbol to visually communicate core parts of the product and available actions. Icons can act as wayfinding tools to help users quickly understand their location within the interface and common interaction patterns.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/media/icon
  """
  use OctantisWeb.Core, :web_component

  alias OctantisWeb.Components.PolarisWC.Types

  @doc @moduledoc

  s_attr :color, :color, doc: "Modify the color to be more or less intense."

  s_attr :interest_for, :string,
    doc:
      "ID of a component that should respond to interest (e.g. hover and focus) on this component."

  s_attr :size, :string, values: ["small", "base"], doc: "Adjusts the size of the icon."

  s_attr :tone, :tone,
    doc: "Sets the tone of the icon, based on the intention of the information being conveyed."

  s_attr :type, :icon,
    values: Types.icons(),
    doc: "Specifies the type of icon that will be displayed."

  attr :rest, :global

  def s_icon(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-icon {@s_attrs} {@rest}></s-icon>
    """
  end
end
