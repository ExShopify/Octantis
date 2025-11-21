defmodule OctantisWeb.Components.PolarisWC.SPage do
  @moduledoc """
  Use `s-page` as the main container for placing content in your app. Page comes with preset layouts and automatically adds spacing between elements.

  ## Requirements

  Requires `OctantisEventProxy` hook. See Install Hooks README.

  ## Example

  ```elixir
  <.s_page heading="Products">
    <.s_section>
      <.s_text>Hello World</.s_text>
    </.s_section>
  </.s_page>

  ## See

  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/page
  ```

  """

  use OctantisWeb.Core, :web_component

  import OctantisWeb.Components.PolarisWC.SBox
  import OctantisWeb.Components.PolarisWC.SButton
  import OctantisWeb.Components.PolarisWC.SGrid
  import OctantisWeb.Components.PolarisWC.SLink
  import OctantisWeb.Components.PolarisWC.SSection
  import OctantisWeb.Components.PolarisWC.SStack

  @doc @moduledoc

  ## Properties

  s_attr :id, :string,
    required: true,
    doc: """
    A unique identifier for the element.
    """

  s_attr :heading, :string,
    doc: """
    The main page heading
    """

  s_attr :inline_size, :string,
    doc: """
      "small" | "base" | "large"

      The inline size of the page

      - `base` corresponds to a set default inline size
      - `large` full width with whitespace
    """

  ## Events

  s_attr :connected_callback, :event

  s_attr :disconnected_callback, :event

  ## Slots

  slot :aside,
    doc: """
    HTMLElement

    The content to display in the aside section of the page.

    This slot is only rendered when `inlineSize` is "base".
    """ do
    attr :as, :atom, values: [:section]
  end

  slot :breadcrumb_action,
    doc: """
    Navigations back actions for the page.

    Only accepts `Link` components.
    """

  slot :primary_action,
    doc: """
    The primary action for the page.

    Only accepts a single `Button` component with a `variant` of `primary`.
    """

  slot :secondary_action,
    doc: """
    Secondary actions for the page.

    Only accepts `ButtonGroup` and `Button` components with a `variant` of `secondary` or `auto`.
    """

  attr :rest, :global

  slot :inner_block

  def s_page(assigns) do
    assigns = assigns |> assign_s_attrs() |> assign_s_attr_events()

    ~H"""
    <s-page {@s_attrs} {@s_events} {@rest}>
      {render_slot(@inner_block)}
      <.s_link :for={link <- @breadcrumb_action} {link} slot="breadcrumb-actions">
        {render_slot(link)}
      </.s_link>
      <.s_button :for={button <- @primary_action} {button} slot="primary-action" variant="primary">
        {render_slot(button)}
      </.s_button>
      <.s_button
        :for={button <- @secondary_action}
        {button}
        slot="secondary-action"
        variant="secondary"
      >
        {render_slot(button)}
      </.s_button>
      <.aside_as :for={aside <- @aside} slot="aside" {aside}>{render_slot(aside)}</.aside_as>
    </s-page>
    """
  end

  @doc """
  As
  A helper for setting the underlaying element of a component
  """

  attr :as, :atom,
    values: [:section, :stack, :box, :grid],
    default: :section

  attr :rest, :global

  slot :inner_block, required: true

  def aside_as(%{as: :section} = assigns),
    do: ~H"<.s_section {@rest}>{render_slot(@inner_block)}</.s_section>"

  def aside_as(%{as: :stack} = assigns),
    do: ~H"<.s_stack {@rest}>{render_slot(@inner_block)}</.s_stack>"

  def aside_as(%{as: :box} = assigns),
    do: ~H"<.s_box {@rest}>{render_slot(@inner_block)}</.s_box>"

  def aside_as(%{as: :grid} = assigns),
    do: ~H"<.s_grid {@rest}>{render_slot(@inner_block)}</.s_grid>"
end
