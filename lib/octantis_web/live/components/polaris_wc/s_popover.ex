defmodule OctantisWeb.Components.PolarisWC.SPopover do
  @moduledoc """
  Popover is used to display content in an overlay that can be triggered by a button.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/overlays/popover


  ### Examples
  ```
  <.s_button command_for="product-options-popover">Product options</.s_button>

  <.s_popover id="product-options-popover" accessibilityLabel="Product options">
    <.s_stack direction="column" gap="small-500" padding="small-200 small-300">
      <.s_button variant="tertiary">Import</.s_button>
      <.s_button variant="tertiary">Export</.s_button>
    </.s_stack>
  </.s_popover>
  ```

  """

  use OctantisWeb.Core, :web_component

  s_attr :id, :string, required: true

  s_attr :block_size, :size_units_or_auto, doc: "SizeUnitsOrAuto - Adjust the block size."

  s_attr :inline_size, :size_units_or_auto, doc: "SizeUnitsOrAuto - Adjust the inline size."

  s_attr :max_block_size, :size_units_or_none,
    doc: "SizeUnitsOrNone - Adjust the maximum block size."

  s_attr :max_inline_size, :size_units_or_none,
    doc: "SizeUnitsOrNone - Adjust the maximum inline size."

  s_attr :min_block_size, :size_units, doc: "SizeUnits - Adjust the minimum block size."

  s_attr :min_inline_size, :size_units, doc: "SizeUnits - djust the minimum inline size."

  slot :inner_block

  attr :rest, :global

  @doc @moduledoc

  def s_popover(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-popover {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-popover>
    """
  end
end
