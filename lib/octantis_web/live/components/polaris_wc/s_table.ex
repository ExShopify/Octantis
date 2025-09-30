defmodule OctantisWeb.Components.PolarisWC.STable do
  @moduledoc """
  Display data clearly in rows and columns, helping users view, analyze, and compare information. Automatically renders as a list on small screens and a table on large ones.

  ## Example

  ```elixir
  <.s_table
    rows=[
      %{
        name:  "John Doe",
        email: "john.doe@example.com",
        phone: "123-456-7890"
      },
      %{
        name:  "Jane Doe",
        email: "jane.doe@example.com",
        phone: "123-456-7890"
      },
      %{
        name:  "Brandon Doe",
        email: "brandon.doe@example.com"
        phone: "123-456-7890"
      },
    ]
  >
    <:s_table_header>Name</:s_table_header>
    <:s_table_header>Email</:s_table_header>
    <:s_table_header>Phone</:s_table_header>
    <:s_table_cell :let={row}>{row.name}</:s_table_cell>
    <:s_table_cell :let={row}>{row.email}</:s_table_cell>
    <:s_table_cell :let={row}>{row.phone}</:s_table_cell>
  </.s_table>
  ```

  ## See
  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/table
  """

  use OctantisWeb.Core, :web_component

  import OctantisWeb.Components.PolarisWC.STableHeaderRow
  import OctantisWeb.Components.PolarisWC.STableHeader
  import OctantisWeb.Components.PolarisWC.STableBody
  import OctantisWeb.Components.PolarisWC.STableRow
  import OctantisWeb.Components.PolarisWC.STableCell

  @doc @moduledoc

  ## Properties

  s_attr :has_next_page, :boolean,
    doc: """
    Whether there's an additional page of data.
    """

  s_attr :has_previous_page, :boolean,
    doc: """
    Whether there's a previous page of data.
    """

  s_attr :loading, :boolean,
    doc: """
    Whether the table is in a loading state, such as initial page load or loading the next page in a paginated table. When true, the table could be in an inert state, which prevents user interaction.
    """

  s_attr :paginate, :boolean,
    doc: """
    Whether to use pagination controls.
    """

  s_attr :variant, :string,
    doc: """
      "auto" | "list"

      Sets the layout of the Table.

      - `list`: The Table is always displayed as a list.
      - `table`: The Table is always displayed as a table.
      - `auto`: The Table is displayed as a table on wide devices and as a list on narrow devices.
    """

  attr :rows, :list,
    doc: """
    A list of rows to be passed to the columns.
    """

  ## Slots

  slot :filters,
    doc: """
    HTMLElement

    Additional filters to display in the table. For example, the `s-search-field` component can be used to filter the table data.
    """

  ## Events

  s_attr :nextpage, :event,
    doc: """
    CallbackEventListener<typeof tagName> | null
    """

  s_attr :previouspage, :event,
    doc: """
    CallbackEventListener<typeof tagName> | null
    """

  s_attr :click_delegate, :string,
    doc: """
      The ID of an interactive element (e.g. `s-link`) in the row that will be the target of the click when the row is clicked. This is the primary action for the row; it should not be used for secondary actions.

      This is a click-only affordance, and does not introduce any keyboard or screen reader affordances. Which is why the target element must be in the table; so that keyboard and screen reader users can interact with it normally.
    """

  attr :rest, :global

  slot :s_table_header,
    doc: """
     Display column names at the top of a table.
    """

  slot :s_table_cell,
    doc: """
    Display data within a cell in a table row.
    """

  def s_table(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-table {@s_attrs} {@rest}>
      <.s_table_header_row :if={@s_table_header != []}>
        <.s_table_header :for={s_table_header <- @s_table_header} {s_table_header}>
          {render_slot(s_table_header)}
        </.s_table_header>
      </.s_table_header_row>
      <.s_table_body>
        <.s_table_row :for={row <- @rows}>
          <.s_table_cell :for={s_table_cell <- @s_table_cell} {s_table_cell}>
            {render_slot(s_table_cell, row)}
          </.s_table_cell>
        </.s_table_row>
      </.s_table_body>
    </s-table>
    """
  end
end
