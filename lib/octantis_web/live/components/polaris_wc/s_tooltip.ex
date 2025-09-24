defmodule OctantisWeb.Components.PolarisWC.STooltip do
  @moduledoc """
    Displays helpful information in a small overlay when users hover or focus on an element. Use to provide additional context without cluttering the interface.

  ## Example
  #
  ```elixir
    <.s_tooltip id="bold-tooltip">Bold</.s_tooltip>
    <.s_button interest_for="bold-tooltip" accessibility_label="Bold">B</.s_button>
  ```

  ## See
  - http://shopify.dev/docs/api/app-home/polaris-web-components/overlays/tooltip
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  attr :rest, :global, include: ~w(slot)

  slot :inner_block

  def s_tooltip(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-tooltip {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-tooltip>
    """
  end
end
