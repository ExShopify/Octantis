defmodule OctantisWeb.Components.PolarisWC.STableCell do
  @moduledoc """
  Display data within a cell in a table row.
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  attr :rest, :global

  slot :inner_block

  def s_table_cell(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-table-cell {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-table-cell>
    """
  end
end
