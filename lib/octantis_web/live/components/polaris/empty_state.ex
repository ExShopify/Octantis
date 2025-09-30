defmodule OctantisWeb.Components.Polaris.EmptyState do
  @moduledoc """
  Empty states are used when a list, table, or chart has no items or data to show. This is an opportunity to provide explanation or guidance to help merchants progress. The empty state component is intended for use when a full page in the admin is empty, and not for individual elements or areas in the interface.

  ## Examples
  ```elixir
  <.empty_state image="/images/relax.svg" heading="You don't have sections">
    <:action content="Broswe library" />
    Things will go here, eventually...
  </.empty_state>
  ```

  ## See
   - https://polaris.shopify.com/components/layout-and-structure/empty-state
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/EmptyState/EmptyState.tsx
  """

  use OctantisWeb.Core

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([
    :box,
    :block_stack,
    :image,
    :text,
    :inline_stack,
    :complex_action
  ])

  alias OctantisWeb.Components.Polaris.ComplexAction

  @doc @moduledoc

  attr :heading, :string, doc: "The empty state heading"

  attr :image, :string,
    required: true,
    doc:
      "The path to the image to display. The image should have ~40px of white space above when empty state is used within a card, modal, or navigation component"

  # attr :large_image, :string, doc: "The path to the image to display on large screens"

  attr :image_contained, :boolean,
    doc: "Whether or not to limit the image to the size of its container on large screens",
    default: false

  attr :full_width, :boolean,
    doc: "Whether or not the content should span the full width of its container ",
    default: false

  # attr :children?: React.ReactNode, doc: "Elements to display inside empty state"
  # attr :footer_content?: React.ReactNode, doc: "Secondary elements to display below empty state actions"

  # attr :action?: ComplexAction, doc: "Primary action for empty state"
  # attr :secondary_action?: ComplexAction, doc: "Secondary action for empty state"

  slot :inner_block

  slot :action, validate_attrs: true do
    ComplexAction.attributes()
  end

  slot :secondary_action, validate_attrs: true do
    ComplexAction.attributes()
  end

  def empty_state(assigns) do
    assigns = assign(assigns, :max_width, max_width(assigns))

    ~H"""
    <.box
      padding_inline_start={[xs: "0"]}
      padding_inline_end={[xs: "0"]}
      padding_block_start={[xs: "500"]}
      padding_block_end={[xs: "1600"]}
    >
      <.block_stack inline_align="center">
        <div class="Polaris-EmptyState__ImageContainer">
          <.image
            alt=""
            role="presentation"
            class="Polaris-EmptyState__Image Polaris-EmptyState--loaded"
            source={@image}
          />
          <div class="Polaris-EmptyState__SkeletonImage Polaris-EmptyState--loaded" />
        </div>
        <.box max_width={@max_width}>
          <.block_stack inline_align="center">
            <.box padding_block_end={[xs: "400"]}>
              <.box padding_block_end={[xs: "150"]}>
                <.text variant="headingMd" as="p" alignment="center">
                  {@heading}
                </.text>
              </.box>
              <.text :if={@inner_block} as="span" alignment="center" variant="bodySm">
                {render_slot(@inner_block)}
              </.text>
            </.box>
            <.inline_stack :if={@action || @secondary_action} align="center" gap={[xs: "200"]}>
              <.complex_action :for={action <- @secondary_action} {action} />
              <.complex_action :for={action <- @action} {action} variant="primary" size="medium" />
            </.inline_stack>
            <%!-- {footerContentMarkup} --%>
          </.block_stack>
        </.box>
      </.block_stack>
    </.box>
    """
  end

  defp max_width(%{full_width: true}), do: "100%"
  defp max_width(_assigns), do: "400px"
end
