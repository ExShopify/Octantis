defmodule OctantisWeb.Components.PolarisWC.SText do
  @moduledoc """
  Displays inline text with specific visual styles or tones. Use to emphasize or differentiate words or phrases within a Paragraph or other block-level components.

  ## Useful for

  - Adding inline text elements such as labels or line errors.
  - Applying different visual tones and text styles to specific words or phrases within a `s-paragraph`, such as a `strong` type or `critical` tone.

  ## Best practices

  - Use plain and clear terms.
  - Don't use jargon or technical language.
  - Don't use different terms to describe the same thing.
  - Don't duplicate content.

  ## Example

  ```elixir
    <.s_text type="strong">Name:</.s_text>
    <.s_text>Jane Doe</.s_text>
  ```

  ## See
  - https://shopify.dev/docs/api/app-home/polaris-web-components/titles-and-text/text
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_visibility, :string,
    doc: """
    "visible" | "hidden" | "exclusive"

    Changes the visibility of the element.

    - `visible`: the element is visible to all users.
    - `hidden`: the element is removed from the accessibility tree but remains visible.
    - `exclusive`: the element is visually hidden but remains in the accessibility tree.
    """

  s_attr :color, :string,
    doc: """
    "base" | "subdued"

    Modify the color to be more or less intense.
    """

  s_attr :dir, :string,
    doc: """
    "" | "auto" | "ltr" | "rtl"

    Indicates the directionality of the element’s text.

    - `ltr`: languages written from left to right (e.g. English)
    - `rtl`: languages written from right to left (e.g. Arabic)
    - `auto`: the user agent determines the direction based on the content
    - `''`: direction is inherited from parent elements (equivalent to not setting the attribute)
    """

  s_attr :font_variant_numeric, :string,
    doc: """
    "auto" | "normal" | "tabular-nums"

    Set the numeric properties of the font.
    """

  s_attr :interest_for, :string,
    doc: """
    ID of a component that should respond to interest (e.g. hover and focus) on this component.
    """

  s_attr :tone, :string,
    doc: """
    "info" | "success" | "warning" | "critical" | "auto" | "neutral" | "caution"

    Sets the tone of the component, based on the intention of the information being conveyed.
    """

  s_attr :type, :string,
    doc: """
    "strong" | "generic" | "address" | "redundant"

    Provide semantic meaning and default styling to the text.

    Other presentation properties on Text override the default styling.
    """

  attr :rest, :global

  slot :inner_block

  def s_text(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-text {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-text>
    """
  end
end
