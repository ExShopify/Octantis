defmodule OctantisWeb.Components.PolarisWC.SParagraph do
  @moduledoc """
    Displays a block of text and can contain inline elements such as buttons, links, or emphasized text. Use to present standalone blocks of content as opposed to inline text.

  ## Useful for

  * Displaying text content in a paragraph format.
  * Grouping elements with the same style. For instance, icons inside a paragraph will automatically adopt the paragraph's tone.

  ## Best practices

  * Use short paragraphs to make your content scannable.
  * Use plain and clear terms.
  * Don't use jargon or technical language.
  * Don't use different terms to describe the same thing.
  * Don't duplicate content.

  ## Example

    ```elixir
    <.s_paragraph>
      Shopify POS is the easiest way to sell your products in person. Available for
      iPad, iPhone, and Android.
    </.s_paragraph>
    ```

   ## See
   - http://shopify.dev/docs/api/app-home/polaris-web-components/titles-and-text/paragraph
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_visibility, :accessibility_visibility,
    doc: """
    Changes the visibility of the element.

    * `visible`: the element is visible to all users.
    * `hidden`: the element is removed from the accessibility tree but remains visible.
    * `exclusive`: the element is visually hidden but remains in the accessibility tree.
    """

  s_attr :color, :color,
    doc: """
    Modify the color to be more or less intense.
    """

  s_attr :dir, :string,
    doc: """
    "" | "auto" | "ltr" | "rtl"

    Indicates the directionality of the element’s text.

    * `ltr`: languages written from left to right (e.g. English)
    * `rtl`: languages written from right to left (e.g. Arabic)
    * `auto`: the user agent determines the direction based on the content
    * `''`: direction is inherited from parent elements (equivalent to not setting the attribute)
    """

  s_attr :font_variant_numeric,
    doc: """
    "auto" | "normal" | "tabular-nums"

    Set the numeric properties of the font.
    """

  s_attr :line_clamp, :integer,
    doc: """
    Truncates the text content to the specified number of lines.
    """

  s_attr :tone, :tone,
    doc: """
    Sets the tone of the component, based on the intention of the information being conveyed.
    """

  attr :rest, :global

  slot :inner_block

  def s_paragraph(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-paragraph {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-paragraph>
    """
  end
end
