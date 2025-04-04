defmodule OctantisWeb.Components.Polaris.Pagination do
  @moduledoc """
    Use pagination to let merchants move through an ordered collection of items that has been split into pages. On the web, pagination uses buttons to move back and forth between pages. On iOS and Android, pagination uses infinite scrolling.
  ## Examples
    ```elixir
    </.Pagination>
    ```

  See
   - https://polaris.shopify.com/components/navigation/pagination
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Pagination/Pagination.tsx
  """

  use OctantisWeb.Core

  import_polaris_components([:button_group, :box, :button, :text, :complex_action])

  alias OctantisWeb.Components.Polaris.Icons

  @doc @moduledoc

  attr :id, :string, default: ""

  # attr :next_keys?: Key[], default: nil, doc: "Keyboard shortcuts for the next button"

  # attr :previous_keys?: Key[], default: nil, doc: "Keyboard shortcuts for the previous button"

  # attr :next_tooltip, :string, default: nil, doc: "Tooltip for the next button"

  # attr :previous_tooltip, :string, default: nil, doc: "Tooltip for the previous button"

  # attr :next_url, :string, default: nil, doc: "The URL of the next page"

  # attr :previous_url, :string, default: nil, doc: "The URL of the previous page"

  attr :has_next, :boolean, default: false, doc: "Whether there is a next page to show"

  attr :has_previous, :boolean, default: false, doc: "Whether there is a previous page to show"

  attr :accessibility_label, :string,
    default: "pagination",
    doc: "Accessible label for the pagination"

  # attr :accessibility_labels?: AccessibilityLabels, default: nil,
  #  doc: "Accessible labels for the buttons and UnstyledLinks"

  attr :on_next, :any, default: nil, doc: "Callback when next button is clicked"

  attr :on_previous, :any, default: nil, doc: "Callback when previous button is clicked"

  attr :label, :string,
    default: nil,
    doc: "Text to provide more context in between the arrow buttons"

  attr :type, :string,
    values: ["page", "table", nil],
    default: nil,
    doc: "Layout structure of the component"

  def pagination(assigns) do
    ~H"""
    <nav aria-label={@accessibility_label} class="Polaris-Pagination">
      <%!-- {previousButtonEvents} --%>
      <%!-- {nextButtonEvents} --%>
      <.button_group variant="segmented">
        <div class="Polaris-ButtonGroup__Item">
          <.button
            id={"PaginationPreviousURL" <> @id}
            phx_click={@on_previous}
            disabled={!@has_previous}
          >
            <:icon><Icons.chevron_left /></:icon>
          </.button>
        </div>
        <.box
          :if={@label}
          padding={[xs: "300"]}
          padding_block_start={[xs: "0"]}
          padding_block_end={[xs: "0"]}
        >
          <div aria-live="polite">
            <span :if={@has_next and @has_previous}>{@label}</span>
            <.text :if={!(@has_next and @has_previous)} tone="subdued" as="span">
              {@label}
            </.text>
          </div>
        </.box>
        <div class="Polaris-ButtonGroup__Item">
          <.button phx_click={@on_next} disabled={!@has_next} id={"PaginationNextURL" <> @id}>
            <:icon><Icons.chevron_right /></:icon>
          </.button>
        </div>
      </.button_group>
    </nav>
    """
  end
end
