defmodule OctantisWeb.Components.PolarisWC.STableHeader do
  @moduledoc """
  Display column names at the top of a table.
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  s_attr :format, :string,
    doc: """
    HeaderFormat

    The format of the column. Will automatically apply styling and alignment to cell content based on the value.

    - `base`: The base format for columns.
    - `currency`: Formats the column as currency.
    - `numeric`: Formats the column as a number.
    """

  s_attr :list_slot, :string,
    doc: """
    ListSlotType

    Content designation for the table's `list` variant.

    - `primary`: The most important content. Only one column can have this designation.
    - `secondary`: The secondary content. Only one column can have this designation.
    - `kicker`: Content that is displayed before primary and secondary content, but with less visual prominence. Only one column can have this designation.
    - `inline`: Content that is displayed inline.
    - `labeled`: Each column with this designation displays as a heading-content pair.
    """

  attr :rest, :global

  slot :inner_block

  def s_table_header(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-table-header {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-table-header>
    """
  end
end
