defmodule OctantisWeb.Components.PolarisWC.SHeading do
  @moduledoc """
    Renders hierarchical titles to communicate the structure and organization of page content. Heading levels adjust automatically based on nesting within parent Section components, ensuring a meaningful and accessible page outline.

    ## Example

    ```elixir
    <.s_heading>Online store dashboard</.s_heading>
    ```

     ## Useful for

    * Creating titles and subtitles for your content that are consistent across your app.
    * Helping users with visual impairments navigate through content effectively using assistive technologies like screen readers.

    ## Considerations

    * The level of the heading is automatically determined by how deeply it's nested inside other components, starting from h2.
    * Default to using the `heading` property in `s-section`. The `s-heading` component should only be used if you need to implement a custom layout for your heading in the UI.

    ## Best practices

    * Use short headings to make your content scannable.
    * Use plain and clear terms.
    * Don't use jargon or technical language.
    * Don't use different terms to describe the same thing.
    * Don't duplicate content.

    ## See
    - http://shopify.dev/docs/api/app-home/polaris-web-components/titles-and-text/heading
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_role, :accessibility_role,
    doc: """
    Sets the semantic meaning of the component’s content. When set, the role will be used by assistive technologies to help users navigate the page.

    * `heading`: defines the element as a heading to a page or section.
    * `presentation`: the heading level will be stripped, and will prevent the element’s implicit ARIA semantics from being exposed to the accessibility tree.
    * `none`: a synonym for the `presentation` role.
    """

  s_attr :accessibility_visibility, :accessibility_visibility,
    doc: """
    Changes the visibility of the element.

    * `visible`: the element is visible to all users.
    * `hidden`: the element is removed from the accessibility tree but remains visible.
    * `exclusive`: the element is visually hidden but remains in the accessibility tree.
    """

  s_attr :line_clamp, :integer,
    doc: """
    Truncates the text content to the specified number of lines.
    """

  attr :rest, :global

  slot :inner_block

  def s_heading(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-heading {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-heading>
    """
  end
end
