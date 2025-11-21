defmodule OctantisWeb.Components.PolarisWC.STableBody do
  @moduledoc """
  Define the main content area of a table, containing rows and cells that display data.
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  attr :rest, :global

  slot :inner_block

  def s_table_body(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-table-body {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-table-body>
    """
  end
end
