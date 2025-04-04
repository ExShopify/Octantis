defmodule OctantisWeb.Components.Polaris.Page do
  @moduledoc """
  Use to build the outer wrapper of a page, including the page title and associated actions.
  ## Examples
    <.page></.page>

  See
    - https://polaris.shopify.com/components/layout-and-structure/page
    - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Page/Page.tsx
    - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Page/tests/Page.test.tsx
  """

  use OctantisWeb.Core

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([:bleed, :box, :text, :complex_action])

  alias OctantisWeb.Components.Polaris.ComplexAction
  alias OctantisWeb.Components.Polaris.Icons

  @doc @moduledoc

  attr :title, :string, doc: "Page title, in large type"
  attr :subtitle, :string, doc: "Page subtitle, in regular type"
  attr :full_width, :boolean, doc: "Remove the normal max-width on the page", default: false

  attr :narrow_width, :boolean,
    doc: "Decreases the maximum layout width. Intended for single-column layouts",
    default: false

  # HeaderProps

  slot :title_metadata, doc: "Important status information shown immediately after the title."

  slot :back_action,
    validate_attrs: true,
    doc: "Breadcrumb back action" do
    ComplexAction.attributes()
  end

  slot :primary_action,
    validate_attrs: true,
    doc: "Primary action for the card" do
    ComplexAction.attributes()
  end

  slot :secondary_action,
    validate_attrs: true,
    doc: "Secondary action for the card" do
    ComplexAction.attributes()
  end

  slot :inner_block, required: true

  def page(assigns) do
    assigns =
      assigns
      |> assign(:class, class(assigns))
      |> assign_new(:title, fn -> nil end)
      |> assign_new(:subtitle, fn -> nil end)

    ~H"""
    <div class={["Octantis-Page", "Polaris-Page", @class]}>
      <.header
        title={@title}
        subtitle={@subtitle}
        title_metadata={@title_metadata}
        back_action={@back_action}
        primary_action={@primary_action}
        secondary_action={@secondary_action}
      />
      {render_slot(@inner_block)}
    </div>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  def build_class({:full_width, true}), do: ["Polaris-Page--fullWidth"]
  def build_class({:narrow_width, true}), do: ["Polaris-Page--narrowWidth"]
  def build_class({_key, _value}), do: []

  @doc """
  A header inside of a page.

  See

  - polaris-react/src/components/Page/components/Header/Header.tsx
  """

  attr :title, :string, doc: "Page title, in large type"
  attr :subtitle, :string, doc: "Page subtitle, in regular type"
  attr :title_hidden, :boolean, doc: "Visually hide the title", default: false
  attr :title_metadata, :any, doc: "title_metadata slot passed through", default: []

  attr :page_ready_accessibility_label, :string,
    doc: ~s"A label to use for the page when the page is ready, used by screen readers.
    Will override the title prop if present"

  attr :filter_actions, :boolean, doc: "Enables filtering action list items"

  attr :pagination, :string, default: nil, doc: "Page-level pagination"
  # attr :back_action, :BreadcrumbsProps["backAction"], doc: "A back action link"
  # attr :action_groups, :MenuGroupDescriptor[], doc: "Collection of page-level groups of secondary actions"
  # attr :additional_metadata, :React.ReactNode | string, doc: "Additional meta data"
  # attr :on_action_rollup?(hasRolledUp: boolean): void,
  #   doc: "Callback that returns true when secondary actions are rolled up into action groups, and false when not"

  # slot :inner_block, required: true

  attr :back_action, :any, doc: "Breadcrumb back action"
  attr :primary_action, :any, doc: "Primary action for the card"
  attr :secondary_action, :any, doc: "Secondary action for the card"

  def header(assigns) do
    ~H"""
    <.box
      position="relative"
      padding_block_start={[xs: "400", md: "600"]}
      padding_block_end={[xs: "400", md: "600"]}
      padding_inline_start={[xs: "400", sm: "0"]}
      padding_inline_end={[xs: "400", sm: "0"]}
    >
      <div class="Polaris-Page-Header--isSingleRow Polaris-Page-Header--mobileView Polaris-Page-Header--noBreadcrumbs Polaris-Page-Header--mediumTitle">
        <div class="Polaris-Page-Header__Row">
          <div :for={action <- @back_action} class="Polaris-Page-Header__BreadcrumbWrapper">
            <.box max_width="100%" padding_inline_end={[xs: "100"]} print_hidden={true}>
              <.complex_action
                icon={&Icons.arrow_left/1}
                accessibility_label={action[:content]}
                {action}
                content=""
              />
            </.box>
          </div>
          <div class="Polaris-Page-Header__TitleWrapper">
            <.title title={@title} subtitle={@subtitle} title_metadata={@title_metadata} />
          </div>
          <div
            :if={@pagination || @primary_action != [] || @secondary_action != {}}
            class="Polaris-Page-Header__RightAlign"
          >
            <div :if={@secondary_action != []} class="Polaris-Page-Header__Actions">
              <div class="Polaris-ActionMenu">
                <div class="Polaris-ActionMenu-Actions__ActionsLayoutOuter">
                  <div class="Polaris-ActionMenu-Actions__ActionsLayout">
                    <div :for={action <- @secondary_action}>
                      <div class="Polaris-ActionMenu-SecondaryAction">
                        <.complex_action {action} />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div :for={action <- @primary_action} class="Polaris-Page-Header__PrimaryActionWrapper">
                <.box print_hidden={true}>
                  <.complex_action variant="primary" {action} />
                </.box>
              </div>
              <div :if={@pagination} class="Polaris-Page-Header__PaginationWrapper">
                <%!-- {pagination} --%>
              </div>
            </div>
          </div>
        </div>
      </div>
    </.box>
    """
  end

  @doc """
  A title inside of a header

  See
    - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Page/components/Header/components/Title/Title.tsx

  """

  attr :title, :string, doc: "Page title, in large type"
  attr :subtitle, :string, doc: "Page subtitle, in regular type"
  attr :title_metadata, :any, doc: "title_metadata slot passed through", default: []

  attr :compact_title, :boolean, doc: "Removes spacing between title and subtitle"

  attr :has_subtitle_max_width, :boolean,
    doc:
      "Whether or not to add a max-width to the subtitle. Gets calculated by the presence of either the secondaryActions or actionGroups props on the Header that consumes this component"

  def title(assigns) do
    ~H"""
    <div class="Polaris-Header-Title__TitleWrapper">
      <h1 class="Polaris-Header-Title Polaris-Header-Title__TitleWithSubtitle">
        <.text as="span" variant="headingLg" font_weight="bold">
          {@title}
        </.text>
      </h1>
      <.bleed :for={title_metadata <- @title_metadata} margin_block={[xs: "100"]}>
        {render_slot(title_metadata)}
      </.bleed>
    </div>
    <div if={@subtitle} class="Polaris-Header-Title__SubTitle">
      <.text as="p" variant="bodySm" tone="subdued">
        {@subtitle}
      </.text>
    </div>
    """
  end
end
