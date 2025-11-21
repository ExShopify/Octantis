defmodule OctantisWeb.Components.PolarisWC.SClickable do
  @moduledoc """
  A generic interactive container component that provides a flexible alternative for custom interactive elements not achievable with existing components like Button or Link. Use it to apply specific styling such as backgrounds, padding, or borders.

  ## Requirements

  Requires `OctantisEventProxy` hook. See Install Hooks README.

  ## Example

  ```elixir
  <.s_clickable padding="base">Create Store</s_clickable>

  <.s_clickable
    border="base"
    padding="base"
    background="subdued"
    border_radius="base"
  >
    View Shipping Settings
  </.s_clickable>
  ```

  ## See
  - https://shopify.dev/docs/api/app-home/polaris-web-components/actions/clickable
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :id, :string,
    required: true,
    doc: """
    A unique identifier for the element.
    """

  s_attr :accessibility_label, :string,
    doc: """
    A label that describes the purpose or contents of the element. When set, it will be announced to users using assistive technologies and will provide them with more context.

    Only use this when the element's content is not enough context for users using assistive technologies.
    """

  s_attr :accessibility_role, :accessibility_role,
    doc: """
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

  s_attr :command, :string,
    doc: """
    '--auto' | '--show' | '--hide' | '--toggle'

    Default: '--auto'

    Sets the action the [command](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#command) should take when this clickable is activated.

    See the documentation of particular components for the actions they support.

    - `--auto`: a default action for the target component.
    - `--show`: shows the target component.
    - `--hide`: hides the target component.
    - `--toggle`: toggles the target component.
    """

  s_attr :command_for, :string,
    doc: """
    string

    Sets the element the [commandFor](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#commandfor) should act on when this clickable is activated.
    """

  s_attr :disabled, :string,
    doc: """
    boolean

    Disables the clickable, meaning it cannot be clicked or receive focus.

    In this state, onClick will not fire. If the click event originates from a child element, the event will immediately stop propagating from this element.

    However, items within the clickable can still receive focus and be interacted with.

    This has no impact on the visual state by default, but developers are encouraged to style the clickable accordingly.
    """

  s_attr :display, :string,
    doc: """
    MaybeResponsive<"auto" | "none">

    Sets the outer [display](https://developer.mozilla.org/en-US/docs/Web/CSS/display) type of the component. The outer type sets a component's participation in [flow layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_flow_layout).

    - `auto` the component's initial value. The actual value depends on the component and context.
    - `none` hides the component from display and removes it from the accessibility tree, making it invisible to screen readers.
    """

  s_attr :download, :string,
    doc: """
    string

    Causes the browser to treat the linked URL as a download with the string being the file name. Download only works for same-origin URLs or the `blob:` and `data:` schemes.
    """

  s_attr :href, :string,
    doc: """
    string

    The URL to link to.

    - If set, it will navigate to the location specified by `href` after executing the `click` event.
    - If a `commandFor` is set, the `command` will be executed instead of the navigation.
    """

  s_attr :inline_size, :string,
    doc: """
    "auto" | SizeUnits

    Adjust the inline size.
    """

  s_attr :interest_for, :string,
    doc: """
    string

    Sets the element the [interestFor](https://open-ui.org/components/interest-invokers.explainer/#the-pitch-in-code) should act on when this clickable is activated.
    """

  s_attr :loading, :string,
    doc: """
    boolean

    Disables the clickable, and indicates to assistive technology that the loading is in progress.

    This also disables the clickable.
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

  s_attr :target, :string,
    doc: """
    "auto" | AnyString | "\_blank" | "\_self" | "\_parent" | "\_top"

    Specifies where to display the linked URL.
    """

  s_attr :type, :string,
    doc: """
      "button" | "reset" | "submit"

      The behavior of the Button.

      - `submit`: Used to indicate the component acts as a submit button, meaning it submits the closest form.
      - `button`: Used to indicate the component acts as a button, meaning it has no default action.
      - `reset`: Used to indicate the component acts as a reset button, meaning it resets the closest form (returning fields to their default values).

      This property is ignored if the component supports `href` or `commandFor`/`command` and one of them is set.
    """

  ## Events

  s_attr :blur, :event,
    doc: """
    CallbackEventListener\<typeof tagName> | null
    """

  s_attr :click, :event,
    doc: """
    CallbackEventListener\<typeof tagName> | null
    """

  s_attr :focus, :event,
    doc: """
    CallbackEventListener\<typeof tagName> | null
    """

  attr :rest, :global, include: ~w(slot)

  slot :inner_block

  def s_clickable(assigns) do
    assigns = assigns |> assign_s_attrs() |> assign_s_attr_events()

    ~H"""
    <s-clickable {@s_attrs} {@s_events} {@rest}>
      {render_slot(@inner_block)}
    </s-clickable>
    """
  end
end
