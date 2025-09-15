defmodule OctantisWeb.Components.PolarisWC.SStack do
  use OctantisWeb.Core, :web_component

  @moduledoc """
  Organizes elements horizontally or vertically along the block or inline axis. Use to structure layouts, group related components, or control spacing between elements.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/stack
  """

  alias OctantisWeb.Components.PolarisWC.Types

  s_attr :accessibility_label, :string,
    doc: ~S"""
    A label that describes the purpose or contents of the element. When set, it will be announced to users using assistive technologies and will provide them with more context.

    Only use this when the element's content is not enough context for users using assistive technologies.
    """

  s_attr :accessibility_role, :string,
    values: Types.accessibility_role(),
    doc: ~S"""
    Sets the semantic meaning of the component’s content. When set, the role will be used by assistive technologies to help users navigate the page.
    """

  s_attr :accessibility_visibility, :string,
    values: Types.accessibility_visibility(),
    doc: ~S"""
    Changes the visibility of the element.
        visible: the element is visible to all users.
        hidden: the element is removed from the accessibility tree but remains visible.
        exclusive: the element is visually hidden but remains in the accessibility tree.
    """

  s_attr :align_content, :string
  s_attr :align_items, :string
  s_attr :background, :string
  s_attr :block_size, :string
  s_attr :border, :string
  s_attr :border_color, :string
  s_attr :border_radius, :string
  s_attr :border_style, :string
  s_attr :border_width, :string
  s_attr :column_gap, :string

  s_attr :direction, {:responsive, :direction},
    doc: ~S"""
    Sets how the Stack's children are placed within the Stack.

    direction either accepts:

        a single value either inline or block
        OR a responsive value string with the supported SpacingKeyword as a query value.
    """

  s_attr :display, :string
  s_attr :gap, :string
  s_attr :inline_size, :string
  s_attr :justify_content, :string
  s_attr :max_block_size, :string
  s_attr :max_inline_size, :string
  s_attr :min_block_size, :string
  s_attr :overflow, :string
  s_attr :padding, :string
  s_attr :padding_block, :string
  s_attr :padding_block_end, :string
  s_attr :padding_block_start, :string
  s_attr :padding_inline, :string
  s_attr :padding_inline_end, :string
  s_attr :padding_inline_start, :string
  s_attr :row_gap, :string

  @doc @moduledoc

  def s_stack(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-stack {@s_attrs}>{render_slot(@inner_block)}</s-stack>
    """
  end
end
