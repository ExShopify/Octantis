defmodule OctantisWeb.Components.PolarisWC.SIcon do
  @moduledoc """
  Renders a graphic symbol to visually communicate core parts of the product and available actions. Icons can act as wayfinding tools to help users quickly understand their location within the interface and common interaction patterns.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/media/icon
  """
  use OctantisWeb.Core

  alias OctantisWeb.Components.PolarisWC.Types

  attr :color, :string,
    values: ["base", "subdued"],
    doc: "Modify the color to be more or less intense."

  attr :interest_for, :string,
    doc:
      "ID of a component that should respond to interest (e.g. hover and focus) on this component."

  attr :size, :string, values: ["small", "base"], doc: "Adjusts the size of the icon."

  attr :tone, :string,
    values: Types.tones(),
    doc: "Sets the tone of the icon, based on the intention of the information being conveyed."

  attr :type, :string,
    values: Types.icons(),
    doc: "Specifies the type of icon that will be displayed."

  @doc @moduledoc

  @attributes [
                {:id, :string},
                {:color, :string},
                {:interest_for, :string},
                {:size, :string},
                {:tone, :string},
                {:type, :string}
              ]
              |> Map.new()
  def s_icon(assigns) do
    assigns = assigns |> assign_attrs(@attributes)

    ~H"""
    <s-icon {@attrs}></s-icon>
    """
  end
end
