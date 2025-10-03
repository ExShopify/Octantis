defmodule OctantisWeb.Components.PolarisWC.SStack do
  @moduledoc """
  Organizes elements horizontally or vertically along the block or inline axis. Use to structure layouts, group related components, or control spacing between elements.

  ## Useful for

  - Placing items in rows or columns when sections don't work for your layout.
  - Controlling the spacing between elements.

  ## Considerations

  - Stack doesn't add any padding by default. If you want padding around your stacked elements, use `base` to apply the default padding.
  - When spacing becomes limited, Stack will always wrap children to a new line.

  ## Best practices

  - Use smaller gaps between small elements and larger gaps between big ones.
  - Maintain consistent spacing in stacks across all pages of your app.

  ## Example

  ```elixir
  <.s_stack gap="base">
      <.s_badge>Paid</.s_badge>
      <.s_badge>Processing</.s_badge>
      <.s_badge>Filled</.s_badge>
      <.s_badge>Completed</.s_badge>
  </.s_stack>
  ```

  ## See

  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/stack
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  alias OctantisWeb.Components.PolarisWC.Types

  ## Properties

  s_attr :accessibility_label, :string,
    doc: """
    A label that describes the purpose or contents of the element. When set, it will be announced to users using assistive technologies and will provide them with more context.

    Only use this when the element's content is not enough context for users using assistive technologies.
    """

  s_attr :accessibility_role, Types.accessibility_role(),
    doc: """
    'main' | 'header' | 'footer' | 'section' | 'aside' | 'navigation' | 'ordered-list' | 'list-item' | 'list-item-separator' | 'unordered-list' | 'separator' | 'status' | 'alert' | 'generic' | 'presentation' | 'none'

    Sets the semantic meaning of the component’s content. When set, the role will be used by assistive technologies to help users navigate the page.
    """

  s_attr :accessibility_visibility, Types.accessibility_visibility(),
    doc: """
    "visible" | "hidden" | "exclusive"

    Changes the visibility of the element.

    - `visible`: the element is visible to all users.
    - `hidden`: the element is removed from the accessibility tree but remains visible.
    - `exclusive`: the element is visually hidden but remains in the accessibility tree.
    """

  s_attr :align_content, :string,
    doc: """
    'normal' | BaselinePosition | ContentDistribution | OverflowPosition | ContentPosition

    Aligns the Stack's children along the block axis.

    This overrides the block value of `alignContent`.
    """

  s_attr :align_items, :string,
    doc: """
    'normal' | 'stretch' | BaselinePosition | OverflowPosition | ContentPosition

    Aligns the Stack's children along the block axis.
    """

  s_attr :background, :string,
    doc: """
    'transparent' | 'subdued' | 'base' | 'strong'

    Adjust the background of the component.
    """

  s_attr :block_size, :string,
    doc: """
    SizeUnitsOrAuto

    Adjust the [block size](https://developer.mozilla.org/en-US/docs/Web/CSS/block-size).

    """

  s_attr :border, :string,
    doc: """
    BorderShorthand

    Set the border via the shorthand property.

    This can be a size, optionally followed by a color, optionally followed by a style.

    If the color is not specified, it will be `base`.

    If the style is not specified, it will be `auto`.

    Values can be overridden by `borderWidth`, `borderStyle`, and `borderColor`.
    """

  s_attr :border_color, :string,
    doc: """
    "" | ColorKeyword

    Adjust the color of the border.
    """

  s_attr :border_radius, :string,
    doc: """
    MaybeAllValuesShorthandProperty\<BoxBorderRadii>

    Adjust the radius of the border.
    """

  s_attr :border_style, :string,
    doc: """
    "" | MaybeAllValuesShorthandProperty\<BoxBorderStyles>

    Adjust the style of the border.
    """

  s_attr :border_width, :string,
    doc: """
    "" | MaybeAllValuesShorthandProperty<"small" | "small-100" | "base" | "large" | "large-100" | "none">

    Adjust the width of the border.
    """

  s_attr :column_gap, {:responsive, :string},
    doc: """
    MaybeResponsive<"" | SpacingKeyword>

    Adjust spacing between elements in the inline axis.

    This overrides the column value of `gap`. `columnGap` either accepts:

    - a single SpacingKeyword value (e.g. `large-100`)
    - OR a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported SpacingKeyword as a query value.
    """

  s_attr :direction, {:responsive, :direction},
    doc: """
    MaybeResponsive<"inline" | "block">

    Sets how the Stack's children are placed within the Stack.

    `direction` either accepts:

    - a single value either `inline` or `block`
    - OR a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported SpacingKeyword as a query value.
    """

  s_attr :display, {:responsive, :string},
    doc: """
    MaybeResponsive<"auto" | "none">

    Sets the outer [display](https://developer.mozilla.org/en-US/docs/Web/CSS/display) type of the component. The outer type sets a component's participation in [flow layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_flow_layout).

    - `auto` the component's initial value. The actual value depends on the component and context.
    - `none` hides the component from display and removes it from the accessibility tree, making it invisible to screen readers.
    """

  s_attr :gap, {:responsive, :string},
    doc: """
    MaybeResponsive\<MaybeTwoValuesShorthandProperty\<SpacingKeyword>>

    Adjust spacing between elements.

    `gap` can either accept:

    - a single SpacingKeyword value applied to both axes (e.g. `large-100`)
    - OR a pair of values (eg `large-100 large-500`) can be used to set the inline and block axes respectively
    - OR a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported SpacingKeyword as a query value.
    """

  s_attr :inline_size, :string,
    doc: """
    SizeUnitsOrAuto

    Adjust the [inline size](https://developer.mozilla.org/en-US/docs/Web/CSS/inline-size).
    """

  s_attr :justify_content, :string,
    doc: """
    JustifyContentKeyword

    Aligns the Stack's children along the inline axis.
    """

  s_attr :max_block_size, :string,
    doc: """
    SizeUnitsOrNone

    Adjust the [maximum block size](https://developer.mozilla.org/en-US/docs/Web/CSS/max-block-size).
    """

  s_attr :max_inline_size, :string,
    doc: """
    SizeUnitsOrNone

    Adjust the [maximum inline size](https://developer.mozilla.org/en-US/docs/Web/CSS/max-inline-size).
    """

  s_attr :min_block_size, :string,
    doc: """
    SizeUnits

    Adjust the [minimum block size](https://developer.mozilla.org/en-US/docs/Web/CSS/min-block-size).
    """

  s_attr :min_inline_size, :string,
    doc: """
    SizeUnits

    Adjust the [minimum inline size](https://developer.mozilla.org/en-US/docs/Web/CSS/min-inline-size).
    """

  s_attr :overflow, :string,
    doc: """
    "visible" | "hidden"

    Sets the overflow behavior of the element.

    - `hidden`: clips the content when it is larger than the element’s container. The element will not be scrollable and the users will not be able to access the clipped content by dragging or using a scroll wheel on a mouse.
    - `visible`: the content that extends beyond the element’s container is visible.
    """

  s_attr :padding, {:responsive, :string},
    doc: """
    MaybeResponsive\<MaybeAllValuesShorthandProperty\<PaddingKeyword>>

    Adjust the padding of all edges.

    [1-to-4-value syntax](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties#edges_of_a_box) is supported. Note that, contrary to the CSS, it uses flow-relative values and the order is:

    - 4 values: `block-start inline-end block-end inline-start`
    - 3 values: `block-start inline block-end`
    - 2 values: `block inline`

    For example:

    - `large` means block-start, inline-end, block-end and inline-start paddings are `large`.
    - `large none` means block-start and block-end paddings are `large`, inline-start and inline-end paddings are `none`.
    - `large none large` means block-start padding is `large`, inline-end padding is `none`, block-end padding is `large` and inline-start padding is `none`.
    - `large none large small` means block-start padding is `large`, inline-end padding is `none`, block-end padding is `large` and inline-start padding is `small`.

    A padding value of `auto` will use the default padding for the closest container that has had its usual padding removed.

    `padding` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_block, {:responsive, :string},
    doc: """
    MaybeResponsive<"" | MaybeTwoValuesShorthandProperty\<PaddingKeyword>>

    Adjust the block-padding.

    - `large none` means block-start padding is `large`, block-end padding is `none`.

    This overrides the block value of `padding`.

    `paddingBlock` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_block_end, {:responsive, :string},
    doc: """
    MaybeResponsive<"" | PaddingKeyword>

    Adjust the block-end padding.

    This overrides the block-end value of `paddingBlock`.

    `paddingBlockEnd` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_block_start, {:responsive, :string},
    doc: """
    MaybeResponsive<"" | PaddingKeyword>

    Adjust the block-start padding.

    This overrides the block-start value of `paddingBlock`.

    `paddingBlockStart` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_inline, {:responsive, :string},
    doc: """
    MaybeResponsive<"" | MaybeTwoValuesShorthandProperty\<PaddingKeyword>>

    Adjust the inline padding.

    - `large none` means inline-start padding is `large`, inline-end padding is `none`.

    This overrides the inline value of `padding`.

    `paddingInline` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_inline_end, {:responsive, :string},
    doc: """
    MaybeResponsive<"" | PaddingKeyword>

    Adjust the inline-end padding.

    This overrides the inline-end value of `paddingInline`.

    `paddingInlineEnd` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_inline_start, {:responsive, :string},
    doc: """
    MaybeResponsive<"" | PaddingKeyword>

    Adjust the inline-start padding.

    This overrides the inline-start value of `paddingInline`.

    `paddingInlineStart` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :row_gap, {:responsive, :string},
    doc: """
    MaybeResponsive<"" | SpacingKeyword>

    Adjust spacing between elements in the block axis.

    This overrides the row value of `gap`. `rowGap` either accepts:

    - a single SpacingKeyword value (e.g. `large-100`)
    - OR a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported SpacingKeyword as a query value.
    """

  attr :rest, :global

  slot :inner_block

  def s_stack(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-stack {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-stack>
    """
  end
end
