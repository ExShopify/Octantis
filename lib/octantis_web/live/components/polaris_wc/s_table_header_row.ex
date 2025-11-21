defmodule OctantisWeb.Components.PolarisWC.STableHeaderRow do
  @moduledoc """
  Define a header row in a table, displaying column names and enabling sorting.
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  attr :rest, :global

  slot :inner_block

  def s_table_header_row(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-table-header-row {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-table-header-row>
    """
  end
end
