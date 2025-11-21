defmodule OctantisWeb.Components.PolarisWC.SSection do
  @moduledoc """
  Groups related content into clearly-defined thematic areas. Sections have contextual styling that automatically adapts based on nesting depth. They also adjust heading levels to maintain a meaningful and accessible page structure.

  ## Useful for

  * Organizing your page in a logical structure based on nesting levels.
  * Creating consistency across pages.

  ## Considerations

  * When adding headings inside sections they automatically use a specific style, which helps keep the content organized and clear.
  * Built-in spacing is added between nested sections, as well as between heading and content.
  * **Level 1:** Display as responsive cards with background color, rounded corners, and shadow effects. Includes outer padding that can be removed when content like `s-table` needs to expand to the full width of the section.
  * **Nested sections:** Don't have any background color or effects by default.

  ## Example

  ```elixir
  <.s_section heading="Online store dashboard">
    <.s_paragraph>View a summary of your online store’s performance.</.s_paragraph>
  </.s_section>
  ```

  ## See
  - http://shopify.dev/docs/api/app-home/polaris-web-components/structure/section
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_label, :string,
    doc: """
    A label used to describe the section that will be announced by assistive technologies.

    When no `heading` property is provided or included as a children of the Section, you **must** provide an `accessibilityLabel` to describe the Section. This is important as it allows assistive technologies to provide the right context to users.
    """

  s_attr :heading, :string,
    doc: """
    A title that describes the content of the section.
    """

  s_attr :padding, :padding,
    doc: """
    Adjust the padding of all edges.

    * `base`: applies padding that is appropriate for the element. Note that it may result in no padding if this is the right design decision in a particular context.
    * `none`: removes all padding from the element. This can be useful when elements inside the Section need to span to the edge of the Section. For example, a full-width image. In this case, rely on `s-box` with a padding of 'base' to bring back the desired padding for the rest of the content.
    """

  attr :rest, :global

  slot :inner_block

  def s_section(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-section {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-section>
    """
  end
end
