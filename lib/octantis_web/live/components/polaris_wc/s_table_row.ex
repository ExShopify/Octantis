defmodule OctantisWeb.Components.PolarisWC.STableRow do
  @moduledoc """
  Display a row of data within the body of a table.
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  s_attr :click_delegate, :string,
    doc: """
      The ID of an interactive element (e.g. `s-link`) in the row that will be the target of the click when the row is clicked. This is the primary action for the row; it should not be used for secondary actions.

      This is a click-only affordance, and does not introduce any keyboard or screen reader affordances. Which is why the target element must be in the table; so that keyboard and screen reader users can interact with it normally.
    """

  attr :rest, :global

  slot :inner_block

  def s_table_row(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-table-row {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-table-row>
    """
  end
end
