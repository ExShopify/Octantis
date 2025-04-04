defmodule OctantisWeb.Components.Polaris.MediaCard do
  @moduledoc """
  Media cards provide a consistent layout to present visual information to merchants.
  Visual media is used to provide additional context to the written information it's paired with.

  ## Examples
  ```elixir
  <.media_card description="description" title="title">
    <img
      alt=""
      width="100%"
      height="100%"
      style="object-fit:cover;object-position:center"
      src="https://burst.shopifycdn.com/photos/business-woman-smiling-in-office.jpg?width=1850"
    />
  </.media_card>
  ```

  See
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/MediaCard/MediaCard.tsx
   - https://polaris.shopify.com/components/layout-and-structure/media-card
  """

  use OctantisWeb.Core

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([
    :box,
    :block_stack,
    :button_group,
    :card,
    :inline_stack,
    :text,
    :inline_grid
  ])

  alias OctantisWeb.Components.Polaris.ComplexAction

  @doc @moduledoc

  # attr :title, :string, doc: "Heading content"

  attr :portrait, :boolean,
    default: false,
    doc: "Whether or not card content should be laid out vertically"

  attr :size, :string,
    values: ["small", "medium"],
    default: "medium",
    doc: "Size of the visual media in the card"

  # attr :onDismiss:, : () => void, doc: "Callback when MediaCard is dismissed"

  attr :class, :any, default: "", doc: "A class name to be added to the component class name"

  attr_extra_styles()

  slot :title, doc: "Heading content"

  slot :inner_block, required: true, doc: "The visual media to display in the card"

  slot :primary_action,
    validate_attrs: true,
    doc: "Main call to action, rendered as a basic button" do
    ComplexAction.attributes()
  end

  slot :secondary_action,
    validate_attrs: true,
    doc: "Secondary call to action, rendered as a plain button" do
    ComplexAction.attributes()
  end

  slot :description, doc: "Body content"

  # attr :popoverActions, : ActionListItemDescriptor[], doc: "Action list items to render in ellipsis popover"

  def media_card(assigns) do
    assigns =
      assigns
      |> assign(:root_class, assigns.class)
      |> assign(:class, [assigns.class, media_card_class(assigns)])
      |> assign(:media_container_class, media_container_class(assigns))
      |> assign(:info_container_class, info_container_class(assigns))
      |> assign(:action_container_class, action_container_class(assigns))
      |> assign(:style, extra_styles(assigns))
      |> assign_new(:description, fn -> nil end)

    ~H"""
    <.card padding={[xs: "0"]} class={[@class, "Octantis-MediaCard"]}>
      <div class={["Polaris-MediaCard", @class]} style={@style}>
        <div class={["Polaris-MediaCard__MediaContainer", @media_container_class]}>
          {render_slot(@inner_block)}
        </div>
        <div class={["Polaris-MediaCard__InfoContainer", @info_container_class]}>
          <.box padding={[xs: "500"]}>
            <.block_stack gap={[xs: "200"]}>
              <.inline_stack wrap={false} align="space-between" gap={[xs: "200"]}>
                <div :if={@title}>
                  <.slot_wrapper slot={@title}>
                    <.text variant="headingSm" as="h2">
                      {@title}
                    </.text>
                  </.slot_wrapper>
                </div>
                <%!-- {popoverOrDismissMarkup} --%>
              </.inline_stack>
              {render_slot(@description)}
              <div
                :if={@primary_action != [] || @secondary_action != []}
                class={["Polaris-MediaCard__ActionContainer", @action_container_class]}
              >
                <.button_group>
                  <:complex_action :for={action <- @primary_action} {action} />
                  <:complex_action :for={action <- @secondary_action} {action} />
                </.button_group>
              </div>
            </.block_stack>
          </.box>
        </div>
      </div>
    </.card>
    """
  end

  def media_card_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&media_card_build_class/1) |> Enum.join(" ")

  def media_card_build_class({:portrait, true}), do: ["Polaris-MediaCard--portrait"]
  def media_card_build_class({_key, _value}), do: []

  def action_container_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&action_container_build_class/1) |> Enum.join(" ")

  def action_container_build_class({:portrait, true}), do: ["Polaris-MediaCard--portrait"]
  def action_container_build_class({_key, _value}), do: []

  def media_container_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&media_container_build_class/1) |> Enum.join(" ")

  def media_container_build_class({:size, "small"}), do: ["Polaris-MediaCard--sizeSmall"]

  def media_container_build_class({:portrait, true}),
    do: ["Polaris-MediaCard Polaris-MediaCard--portrait"]

  def media_container_build_class({_key, _value}), do: []

  def info_container_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&info_container_build_class/1) |> Enum.join(" ")

  def info_container_build_class({:size, "small"}), do: ["Polaris-MediaCard--sizeSmall"]

  def info_container_build_class({:portrait, true}),
    do: ["Polaris-MediaCard Polaris-MediaCard--portrait"]

  def info_container_build_class({_key, _value}), do: []
end
