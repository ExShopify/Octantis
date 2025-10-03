defmodule OctantisWeb.Components.PolarisWC.SGrid do
  @moduledoc """
  Use `s-grid` to organize your content in a matrix of rows and columns and make responsive layouts for pages. Grid follows the same pattern as the [CSS grid layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_grid_layout).

  ## Useful for

  - Organizing content into a grid-like layout with columns and rows with consistent alignment and spacing.
  - Creating responsive layouts with consistent spacing.

  ## Considerations

  - Grid doesn't include any padding by default. If you need padding around your grid, use `base` to apply the default padding.
  - Grid will allow children to overflow unless template rows/columns are properly set.
  - Grid will always wrap children to a new line. If you need to control the wrapping behavior, use `s-stack` or `s-box`.

  ### Example

  ```elixir
    <.s_grid
      grid_template_columns="repeat(2, 1fr)"
      gap="small"
      justify_content="center"
    >
      <:s_grid_item grid_column="span 2" border="base" border_style="dashed">
        Summary of sales
      </:s_grid_item>
      <:s-grid-item grid_column="span 1" border="base" border_style="dashed">
        Orders
      </:s_grid_item>
      <:s_grid_item grid_column="auto" border="base" border_style="dashed">
        Customers
      </:s_grid_item>
    </.s_grid>
    ```

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/grid
  """

  use OctantisWeb.Core, :web_component

  import OctantisWeb.Components.PolarisWC.SGridItem

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_label, :string,
    doc: """
      string

      A label that describes the purpose or contents of the element. When set, it will be announced to users using assistive technologies and will provide them with more context.

      Only use this when the element's content is not enough context for users using assistive technologies.
    """

  s_attr :accessibility_role, :string,
    doc: """
      AccessibilityRole

      Sets the semantic meaning of the component’s content. When set, the role will be used by assistive technologies to help users navigate the page.
    """

  s_attr :accessibility_visibility, :string,
    doc: """
      "visible" | "hidden" | "exclusive"

      Changes the visibility of the element.

      - `visible`: the element is visible to all users.
      - `hidden`: the element is removed from the accessibility tree but remains visible.
      - `exclusive`: the element is visually hidden but remains in the accessibility tree.
    """

  s_attr :align_content, :string,
    doc: """
      "" | AlignContentKeyword

      Aligns the grid along the block (column) axis.

      This overrides the block value of `placeContent`.
    """

  s_attr :align_items, :string,
    doc: """
      "" | AlignItemsKeyword

      Aligns the grid items along the block (column) axis.

      This overrides the block value of `placeItems`.
    """

  s_attr :background, :string,
    doc: """
      BackgroundColorKeyword

      Adjust the background of the element.
    """

  s_attr :block_size, :string,
    doc: """
      "auto" | SizeUnits

      Adjust the block size.
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

      Set the color of the border.

      If set, it takes precedence over the `border` property's color.
    """

  s_attr :border_radius, :string,
    doc: """
      MaybeAllValuesShorthandProperty\<BoxBorderRadii>

      Set the radius of the border.

      [1-to-4-value syntax](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties#edges_of_a_box) is supported. Note that, contrary to the CSS, it uses flow-relative values and the order is:

      - 4 values: `start-start start-end end-end end-start`
      - 3 values: `start-start (start-end & end-start) start-end`
      - 2 values: `(start-start & end-end) (start-end & end-start)`

      For example:

      - `small-100` means start-start, start-end, end-end and end-start border radii are `small-100`.
      - `small-100 none` means start-start and end-end border radii are `small-100`, start-end and end-start border radii are `none`.
      - `small-100 none large-100` means start-start border radius is `small-100`, start-end border radius is `none`, end-end border radius is `large-100` and end-start border radius is `none`.
      - `small-100 none large-100 small-100` means start-start border radius is `small-100`, start-end border radius is `none`, end-end border radius is `large-100` and end-start border radius is `small-100`.
    """

  s_attr :border_style, :string,
    doc: """
      "" | MaybeAllValuesShorthandProperty\<BoxBorderStyles>

      Set the style of the border.

      If set, it takes precedence over the `border` property's style.

      Like CSS, up to 4 values can be specified.

      If one value is specified, it applies to all sides.

      If two values are specified, they apply to the block sides and inline sides respectively.

      If three values are specified, they apply to the block-start, both inline sides, and block-end respectively.

      If four values are specified, they apply to the block-start, block-end, inline-start, and inline-end sides respectively.
    """

  s_attr :border_width, :string,
    doc: """
      "" | MaybeAllValuesShorthandProperty<"small" | "small-100" | "base" | "large" | "large-100" | "none">

      Set the width of the border.

      If set, it takes precedence over the `border` property's width.

      Like CSS, up to 4 values can be specified.

      If one value is specified, it applies to all sides.

      If two values are specified, they apply to the block sides and inline sides respectively.

      If three values are specified, they apply to the block-start, both inline sides, and block-end respectively.

      If four values are specified, they apply to the block-start, block-end, inline-start, and inline-end sides respectively.
    """

  s_attr :column_gap, :string,
    doc: """
      MaybeResponsive<"" | SpacingKeyword>

      Adjust spacing between elements in the inline axis.

      This overrides the column value of `gap`. `columnGap` either accepts:

      - a single SpacingKeyword value (e.g. `large-100`)
      - OR a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported SpacingKeyword as a query value.
    """

  s_attr :display, :string,
    doc: """
      MaybeResponsive<"auto" | "none">

      Sets the outer [display](https://developer.mozilla.org/en-US/docs/Web/CSS/display) type of the component. The outer type sets a component's participation in [flow layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_flow_layout).

      - `auto` the component's initial value. The actual value depends on the component and context.
      - `none` hides the component from display and removes it from the accessibility tree, making it invisible to screen readers.
    """

  s_attr :gap, :string,
    doc: """
      MaybeResponsive\<MaybeTwoValuesShorthandProperty\<SpacingKeyword>>

      Adjust spacing between elements.

      `gap` can either accept:

      - a single SpacingKeyword value applied to both axes (e.g. `large-100`)
      - OR a pair of values (eg `large-100 large-500`) can be used to set the inline and block axes respectively
      - OR a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported SpacingKeyword as a query value.
    """

  s_attr :grid_template_columns, {:responsive, :string},
    doc: """
    Define columns and specify their size. gridTemplateColumns either accepts:

      track sizing values (e.g. 1fr auto)
      OR responsive values string with the supported track sizing values as a query value.

    """

  s_attr :grid_template_rows, {:responsive, :string},
    doc: """
      Define rows and specify their size. gridTemplateRows either accepts:

        track sizing values (e.g. 1fr auto)
        OR responsive values string with the supported track sizing values as a query value.
    """

  s_attr :inline_size, :string,
    doc: """
      "auto" | SizeUnits

      Adjust the inline size.
    """

  s_attr :justify_content, :string,
    doc: """
      "" | JustifyContentKeyword

      Aligns the grid along the inline (row) axis.

      This overrides the inline value of `placeContent`.
    """

  s_attr :justify_items, :string,
    doc: """
      "" | JustifyItemsKeyword

      Aligns the grid items along the inline (row) axis.

      This overrides the inline value of `placeItems`.
    """

  s_attr :max_block_size, :string,
    doc: """
      "none" | SizeUnits

      Adjust the maximum block size.
    """

  s_attr :max_inline_size, :string,
    doc: """
      "none" | SizeUnits

      Adjust the maximum inline size.
    """

  s_attr :min_block_size, :string,
    doc: """
      SizeUnits

      Adjust the minimum block size.
    """

  s_attr :min_inline_size, :string,
    doc: """
      SizeUnits

      Adjust the minimum inline size.
    """

  s_attr :overflow, :string,
    doc: """
      "visible" | "hidden"

      Sets the overflow behavior of the element.

      - `hidden`: clips the content when it is larger than the element’s container. The element will not be scrollable and the users will not be able to access the clipped content by dragging or using a scroll wheel on a mouse.
      - `visible`: the content that extends beyond the element’s container is visible.
    """

  s_attr :padding, :string,
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

  s_attr :padding_block, :string,
    doc: """
      MaybeResponsive<"" | MaybeTwoValuesShorthandProperty\<PaddingKeyword>>

      Adjust the block-padding.

      - `large none` means block-start padding is `large`, block-end padding is `none`.

      This overrides the block value of `padding`.

      `paddingBlock` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_block_end, :string,
    doc: """
      MaybeResponsive<"" | PaddingKeyword>

      Adjust the block-end padding.

      This overrides the block-end value of `paddingBlock`.

      `paddingBlockEnd` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_block_start, :string,
    doc: """
      MaybeResponsive<"" | PaddingKeyword>

      Adjust the block-start padding.

      This overrides the block-start value of `paddingBlock`.

      `paddingBlockStart` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_inline, :string,
    doc: """
      MaybeResponsive<"" | MaybeTwoValuesShorthandProperty\<PaddingKeyword>>

      Adjust the inline padding.

      - `large none` means inline-start padding is `large`, inline-end padding is `none`.

      This overrides the inline value of `padding`.

      `paddingInline` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_inline_end, :string,
    doc: """
      MaybeResponsive<"" | PaddingKeyword>

      Adjust the inline-end padding.

      This overrides the inline-end value of `paddingInline`.

      `paddingInlineEnd` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :padding_inline_start, :string,
    doc: """
      MaybeResponsive<"" | PaddingKeyword>

      Adjust the inline-start padding.

      This overrides the inline-start value of `paddingInline`.

      `paddingInlineStart` also accepts a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported PaddingKeyword as a query value.
    """

  s_attr :place_content, :string,
    doc: """
      "normal normal" | "normal stretch" | "normal start" | "normal end" | "normal center" | "normal unsafe start" | "normal unsafe end" | "normal unsafe center" | "normal safe start" | "normal safe end" | "normal safe center" | "stretch normal" | "stretch stretch" | "stretch start" | "stretch end" | "stretch center" | "stretch unsafe start" | "stretch unsafe end" | "stretch unsafe center" | "stretch safe start" | "stretch safe end" | "stretch safe center" | "baseline normal" | "baseline stretch" | "baseline start" | "baseline end" | "baseline center" | "baseline unsafe start" | "baseline unsafe end" | "baseline unsafe center" | "baseline safe start" | "baseline safe end" | "baseline safe center" | "first baseline normal" | "first baseline stretch" | "first baseline start" | "first baseline end" | "first baseline center" | "first baseline unsafe start" | "first baseline unsafe end" | "first baseline unsafe center" | "first baseline safe start" | "first baseline safe end" | "first baseline safe center" | "last baseline normal" | "last baseline stretch" | "last baseline start" | "last baseline end" | "last baseline center" | "last baseline unsafe start" | "last baseline unsafe end" | "last baseline unsafe center" | "last baseline safe start" | "last baseline safe end" | "last baseline safe center" | "start normal" | "start stretch" | "start start" | "start end" | "start center" | "start unsafe start" | "start unsafe end" | "start unsafe center" | "start safe start" | "start safe end" | "start safe center" | "end normal" | "end stretch" | "end start" | "end end" | "end center" | "end unsafe start" | "end unsafe end" | "end unsafe center" | "end safe start" | "end safe end" | "end safe center" | "center normal" | "center stretch" | "center start" | "center end" | "center center" | "center unsafe start" | "center unsafe end" | "center unsafe center" | "center safe start" | "center safe end" | "center safe center" | "unsafe start normal" | "unsafe start stretch" | "unsafe start start" | "unsafe start end" | "unsafe start center" | "unsafe start unsafe start" | "unsafe start unsafe end" | "unsafe start unsafe center" | "unsafe start safe start" | "unsafe start safe end" | "unsafe start safe center" | "unsafe end normal" | "unsafe end stretch" | "unsafe end start" | "unsafe end end" | "unsafe end center" | "unsafe end unsafe start" | "unsafe end unsafe end" | "unsafe end unsafe center" | "unsafe end safe start" | "unsafe end safe end" | "unsafe end safe center" | "unsafe center normal" | "unsafe center stretch" | "unsafe center start" | "unsafe center end" | "unsafe center center" | "unsafe center unsafe start" | "unsafe center unsafe end" | "unsafe center unsafe center" | "unsafe center safe start" | "unsafe center safe end" | "unsafe center safe center" | "safe start normal" | "safe start stretch" | "safe start start" | "safe start end" | "safe start center" | "safe start unsafe start" | "safe start unsafe end" | "safe start unsafe center" | "safe start safe start" | "safe start safe end" | "safe start safe center" | "safe end normal" | "safe end stretch" | "safe end start" | "safe end end" | "safe end center" | "safe end unsafe start" | "safe end unsafe end" | "safe end unsafe center" | "safe end safe start" | "safe end safe end" | "safe end safe center" | "safe center normal" | "safe center stretch" | "safe center start" | "safe center end" | "safe center center" | "safe center unsafe start" | "safe center unsafe end" | "safe center unsafe center" | "safe center safe start" | "safe center safe end" | "safe center safe center" | AlignContentKeyword | "normal space-between" | "normal space-around" | "normal space-evenly" | "baseline space-between" | "baseline space-around" | "baseline space-evenly" | "first baseline space-between" | "first baseline space-around" | "first baseline space-evenly" | "last baseline space-between" | "last baseline space-around" | "last baseline space-evenly" | "start space-between" | "start space-around" | "start space-evenly" | "end space-between" | "end space-around" | "end space-evenly" | "center space-between" | "center space-around" | "center space-evenly" | "unsafe start space-between" | "unsafe start space-around" | "unsafe start space-evenly" | "unsafe end space-between" | "unsafe end space-around" | "unsafe end space-evenly" | "unsafe center space-between" | "unsafe center space-around" | "unsafe center space-evenly" | "safe start space-between" | "safe start space-around" | "safe start space-evenly" | "safe end space-between" | "safe end space-around" | "safe end space-evenly" | "safe center space-between" | "safe center space-around" | "safe center space-evenly" | "stretch space-between" | "stretch space-around" | "stretch space-evenly" | "space-between normal" | "space-between start" | "space-between end" | "space-between center" | "space-between unsafe start" | "space-between unsafe end" | "space-between unsafe center" | "space-between safe start" | "space-between safe end" | "space-between safe center" | "space-between stretch" | "space-between space-between" | "space-between space-around" | "space-between space-evenly" | "space-around normal" | "space-around start" | "space-around end" | "space-around center" | "space-around unsafe start" | "space-around unsafe end" | "space-around unsafe center" | "space-around safe start" | "space-around safe end" | "space-around safe center" | "space-around stretch" | "space-around space-between" | "space-around space-around" | "space-around space-evenly" | "space-evenly normal" | "space-evenly start" | "space-evenly end" | "space-evenly center" | "space-evenly unsafe start" | "space-evenly unsafe end" | "space-evenly unsafe center" | "space-evenly safe start" | "space-evenly safe end" | "space-evenly safe center" | "space-evenly stretch" | "space-evenly space-between" | "space-evenly space-around" | "space-evenly space-evenly"

      A shorthand property for `justify-content` and `align-content`.
    """

  s_attr :place_items, :string,
    doc: """
      AlignItemsKeyword | "normal normal" | "normal stretch" | "normal baseline" | "normal first baseline" | "normal last baseline" | "normal start" | "normal end" | "normal center" | "normal unsafe start" | "normal unsafe end" | "normal unsafe center" | "normal safe start" | "normal safe end" | "normal safe center" | "stretch normal" | "stretch stretch" | "stretch baseline" | "stretch first baseline" | "stretch last baseline" | "stretch start" | "stretch end" | "stretch center" | "stretch unsafe start" | "stretch unsafe end" | "stretch unsafe center" | "stretch safe start" | "stretch safe end" | "stretch safe center" | "baseline normal" | "baseline stretch" | "baseline baseline" | "baseline first baseline" | "baseline last baseline" | "baseline start" | "baseline end" | "baseline center" | "baseline unsafe start" | "baseline unsafe end" | "baseline unsafe center" | "baseline safe start" | "baseline safe end" | "baseline safe center" | "first baseline normal" | "first baseline stretch" | "first baseline baseline" | "first baseline first baseline" | "first baseline last baseline" | "first baseline start" | "first baseline end" | "first baseline center" | "first baseline unsafe start" | "first baseline unsafe end" | "first baseline unsafe center" | "first baseline safe start" | "first baseline safe end" | "first baseline safe center" | "last baseline normal" | "last baseline stretch" | "last baseline baseline" | "last baseline first baseline" | "last baseline last baseline" | "last baseline start" | "last baseline end" | "last baseline center" | "last baseline unsafe start" | "last baseline unsafe end" | "last baseline unsafe center" | "last baseline safe start" | "last baseline safe end" | "last baseline safe center" | "start normal" | "start stretch" | "start baseline" | "start first baseline" | "start last baseline" | "start start" | "start end" | "start center" | "start unsafe start" | "start unsafe end" | "start unsafe center" | "start safe start" | "start safe end" | "start safe center" | "end normal" | "end stretch" | "end baseline" | "end first baseline" | "end last baseline" | "end start" | "end end" | "end center" | "end unsafe start" | "end unsafe end" | "end unsafe center" | "end safe start" | "end safe end" | "end safe center" | "center normal" | "center stretch" | "center baseline" | "center first baseline" | "center last baseline" | "center start" | "center end" | "center center" | "center unsafe start" | "center unsafe end" | "center unsafe center" | "center safe start" | "center safe end" | "center safe center" | "unsafe start normal" | "unsafe start stretch" | "unsafe start baseline" | "unsafe start first baseline" | "unsafe start last baseline" | "unsafe start start" | "unsafe start end" | "unsafe start center" | "unsafe start unsafe start" | "unsafe start unsafe end" | "unsafe start unsafe center" | "unsafe start safe start" | "unsafe start safe end" | "unsafe start safe center" | "unsafe end normal" | "unsafe end stretch" | "unsafe end baseline" | "unsafe end first baseline" | "unsafe end last baseline" | "unsafe end start" | "unsafe end end" | "unsafe end center" | "unsafe end unsafe start" | "unsafe end unsafe end" | "unsafe end unsafe center" | "unsafe end safe start" | "unsafe end safe end" | "unsafe end safe center" | "unsafe center normal" | "unsafe center stretch" | "unsafe center baseline" | "unsafe center first baseline" | "unsafe center last baseline" | "unsafe center start" | "unsafe center end" | "unsafe center center" | "unsafe center unsafe start" | "unsafe center unsafe end" | "unsafe center unsafe center" | "unsafe center safe start" | "unsafe center safe end" | "unsafe center safe center" | "safe start normal" | "safe start stretch" | "safe start baseline" | "safe start first baseline" | "safe start last baseline" | "safe start start" | "safe start end" | "safe start center" | "safe start unsafe start" | "safe start unsafe end" | "safe start unsafe center" | "safe start safe start" | "safe start safe end" | "safe start safe center" | "safe end normal" | "safe end stretch" | "safe end baseline" | "safe end first baseline" | "safe end last baseline" | "safe end start" | "safe end end" | "safe end center" | "safe end unsafe start" | "safe end unsafe end" | "safe end unsafe center" | "safe end safe start" | "safe end safe end" | "safe end safe center" | "safe center normal" | "safe center stretch" | "safe center baseline" | "safe center first baseline" | "safe center last baseline" | "safe center start" | "safe center end" | "safe center center" | "safe center unsafe start" | "safe center unsafe end" | "safe center unsafe center" | "safe center safe start" | "safe center safe end" | "safe center safe center"

      A shorthand property for `justify-items` and `align-items`.
    """

  s_attr :row_gap, :string,
    doc: """
    MaybeResponsive<"" | SpacingKeyword>

    Adjust spacing between elements in the block axis.

    This overrides the row value of `gap`. `rowGap` either accepts:

    - a single SpacingKeyword value (e.g. `large-100`)
    - OR a [responsive value](https://shopify.dev/docs/api/app-home/using-polaris-components#responsive-values) string with the supported SpacingKeyword as a query value.
    """

  attr :rest, :global

  slot :s_grid_item,
    doc: """
      See .s_grid_item for attributes

      Display content within a single item of a grid layout.
    """

  def s_grid(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-grid {@s_attrs} {@rest}>
      <.s_grid_item :for={item <- @s_grid_item} {item}>
        {render_slot(item)}
      </.s_grid_item>
    </s-grid>
    """
  end
end
