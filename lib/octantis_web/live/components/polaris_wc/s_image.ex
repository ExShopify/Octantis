defmodule OctantisWeb.Components.PolarisWC.SImage do
  @moduledoc """
  Embeds an image within the interface and controls its presentation. Use to visually illustrate concepts, showcase products, or support user tasks and interactions.

  ## Useful for
  , :string, doc: \"""""
  "
  s_attr :adding ilustrations and photos.

  ## Best practices
  , :string, doc: \"""""
  "
  s_attr :use high-esolution images to ensure a professional and high-quality experien\"""
  ce., :string, doc: \"""
  s_attr :use optimized images so your app loads as fast as possible., :string, doc: \"""""

  s_attr :use images intentionally, these should add clarity and lead users to the nex step.

  ## Example

  ```elixir
  <.s_image
    src="https://cdn.shopify.com/static/images/polaris/image-wc_src.png"
    alt="Four pixelated characters ready to build amazing Shopify apps"
    aspect_ratio="59/161"
    inline_size="auto"
  />
  ```

  ## See
  - http://shopify.dev/docs/api/app-home/polaris-web-components/media/image
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties
  s_attr :accessibility_role, :string,
    doc: """
      "none" | "presentation" | "img"

      Sets the semantic meaning of the component’s content. When set, the role will be used by assistive technologies to help users navigate the page.
    """

  s_attr :alt, :string,
    doc: """
      string

      An alternative text description that describe the image for the reader to understand what it is about. It is extremely useful for both users using assistive technology and sighted users. A well written description provides people with visual impairments the ability to participate in consuming non-text content. When a screen readers encounters an `s-image`, the description is read and announced aloud. If an image fails to load, potentially due to a poor connection, the `alt` is displayed on screen instead. This has the benefit of letting a sighted buyer know an image was meant to load here, but as an alternative, they’re still able to consume the text content. Read [considerations when writing alternative text](https://www.shopify.com/ca/blog/image-alt-text#4) to learn more.
    """

  s_attr :aspect_ratio, :string,
    doc: """
      \`${number}\` | \`${number}/${number}\` | \`${number}/ ${number}\` | \`${number} /${number}\` | \`${number} / ${number}\`

      The aspect ratio of the image.

      The rendering of the image will depend on the `inlineSize` value:

      - `inlineSize="fill"`: the aspect ratio will be respected and the image will take the necessary space.
      - `inlineSize="auto"`: the image will not render until it has loaded and the aspect ratio will be ignored.

      For example, if the value is set as `50 / 100`, the getter returns `50 / 100`. If the value is set as `0.5`, the getter returns `0.5 / 1`.
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

  s_attr :inline_size, :string,
    doc: """
      "auto" | "fill"

      The displayed inline width of the image.

      - `fill`: the image will takes up 100% of the available inline size.
      - `auto`: the image will be displayed at its natural size.
    """

  s_attr :loading, :string,
    doc: """
      "eager" | "lazy"

      Determines the loading behavior of the image:

      - `eager`: Immediately loads the image, irrespective of its position within the visible viewport.
      - `lazy`: Delays loading the image until it approaches a specified distance from the viewport.
    """

  s_attr :object_fit, :string,
    doc: """
      "contain" | "cover"

      Determines how the content of the image is resized to fit its container. The image is positioned in the center of the container.
    """

  s_attr :sizes, :string,
    doc: """
      string

      A set of media conditions and their corresponding sizes.
    """

  s_attr :src, :string,
    doc: """
      string

      The image source (either a remote URL or a local file resource).

      When the image is loading or no `src` is provided, a placeholder will be rendered.
    """

  s_attr :src_set, :string,
    doc: """
      string

      A set of image sources and their width or pixel density descriptors.

      This overrides the `src` property.

    ## Events
    """

  s_attr :error, :string,
    doc: """
      OnErrorEventHandler
    """

  s_attr :load, :string,
    doc: """
    CallbackEventListener\<typeof tagName> | null
    """

  attr :rest, :global

  def s_image(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-image {@s_attrs} {@rest}></s-image>
    """
  end
end
