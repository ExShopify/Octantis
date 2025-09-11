defmodule OctantisWeb.Components.PolarisWC.SBadge do
  @moduledoc """
  Inform users about the status of an object or indicate that an action has been completed.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/titles-and-text/badge
  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.PolarisWC.Types

  attr :color, :string,
    values: Types.colours(),
    doc: "Modify the color to be more or less intense."

  attr :icon, :string,
    values: Types.icons(),
    doc: "The type of icon to be displayed in the badge."

  attr :size, :string, values: ["base", "large", "large-100"], doc: "Adjusts the size."

  attr :tone, :string,
    values: Types.tones(),
    doc: "Sets the tone of the Badge, based on the intention of the information being conveyed."

  slot :inner_block

  @doc @moduledoc

  @attributes [
                {:id, :string},
                {:color, :string},
                {:icon, :string},
                {:size, :string},
                {:tone, :string}
              ]
              |> Map.new()

  def s_badge(assigns) do
    assigns = assigns |> assign_attrs(@attributes)

    ~H"""
    <s-badge {@attrs}>{render_slot(@inner_block)}</s-badge>
    """
  end
end
