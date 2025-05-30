defmodule OctantisWeb.Components.Polaris do
  @moduledoc """
  Polaris Components
  These components are an implementation of the Shopify Polaris design system.
  Style attributes are taken from Polaris Tokens. https://polaris.shopify.com/tokens/color
  See https://polaris.shopify.com/components
  """

  use Phoenix.Component

  defdelegate app_bridge_modal(assigns), to: OctantisWeb.Components.Polaris.AppBridgeModal
  defdelegate badge(assigns), to: OctantisWeb.Components.Polaris.Badge
  defdelegate banner(assigns), to: OctantisWeb.Components.Polaris.Banner
  defdelegate bleed(assigns), to: OctantisWeb.Components.Polaris.Bleed
  defdelegate block_stack(assigns), to: OctantisWeb.Components.Polaris.BlockStack
  defdelegate box(assigns), to: OctantisWeb.Components.Polaris.Box
  defdelegate button(assigns), to: OctantisWeb.Components.Polaris.Button
  defdelegate button_group(assigns), to: OctantisWeb.Components.Polaris.ButtonGroup
  defdelegate callout_card(assigns), to: OctantisWeb.Components.Polaris.CalloutCard
  defdelegate card(assigns), to: OctantisWeb.Components.Polaris.Card
  defdelegate choice(assigns), to: OctantisWeb.Components.Polaris.Choice
  defdelegate choice_list(assigns), to: OctantisWeb.Components.Polaris.ChoiceList
  defdelegate collapsible(assigns), to: OctantisWeb.Components.Polaris.Collapsible
  defdelegate complex_action(assigns), to: OctantisWeb.Components.Polaris.ComplexAction
  defdelegate divider(assigns), to: OctantisWeb.Components.Polaris.Divider
  defdelegate empty_state(assigns), to: OctantisWeb.Components.Polaris.EmptyState
  defdelegate filters(assigns), to: OctantisWeb.Components.Polaris.Filters
  defdelegate grid(assigns), to: OctantisWeb.Components.Polaris.Grid
  defdelegate icon(assigns), to: OctantisWeb.Components.Polaris.Icon
  defdelegate image(assigns), to: OctantisWeb.Components.Polaris.Image
  defdelegate index_table(assigns), to: OctantisWeb.Components.Polaris.IndexTable
  defdelegate inline_error(assigns), to: OctantisWeb.Components.Polaris.InlineError
  defdelegate inline_grid(assigns), to: OctantisWeb.Components.Polaris.InlineGrid
  defdelegate inline_stack(assigns), to: OctantisWeb.Components.Polaris.InlineStack
  defdelegate labelled(assigns), to: OctantisWeb.Components.Polaris.Labelled
  defdelegate media_card(assigns), to: OctantisWeb.Components.Polaris.MediaCard
  defdelegate modal(assigns), to: OctantisWeb.Components.Polaris.Modal
  defdelegate page(assigns), to: OctantisWeb.Components.Polaris.Page
  defdelegate pagination(assigns), to: OctantisWeb.Components.Polaris.Pagination
  defdelegate popover(assigns), to: OctantisWeb.Components.Polaris.Popover
  defdelegate radio_button(assigns), to: OctantisWeb.Components.Polaris.RadioButton
  defdelegate select(assigns), to: OctantisWeb.Components.Polaris.Select
  defdelegate skeleton_body_text(assigns), to: OctantisWeb.Components.Polaris.SkeletonBodyText

  defdelegate skeleton_display_text(assigns),
    to: OctantisWeb.Components.Polaris.SkeletonDisplayText

  defdelegate skeleton_thumbnail(assigns), to: OctantisWeb.Components.Polaris.SkeletonThumbnail
  defdelegate spinner(assigns), to: OctantisWeb.Components.Polaris.Spinner
  defdelegate tabs(assigns), to: OctantisWeb.Components.Polaris.Tabs
  defdelegate tag(assigns), to: OctantisWeb.Components.Polaris.Tag
  defdelegate text(assigns), to: OctantisWeb.Components.Polaris.Text
  defdelegate text_field(assigns), to: OctantisWeb.Components.Polaris.TextField
  defdelegate thumbnail(assigns), to: OctantisWeb.Components.Polaris.Thumbnail
  defdelegate unstyled_button(assigns), to: OctantisWeb.Components.Polaris.UnstyledButton
end
