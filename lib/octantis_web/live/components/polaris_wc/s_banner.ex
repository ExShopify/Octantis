defmodule OctantisWeb.Components.PolarisWC.SBanner do
  @moduledoc """
  Highlights important information or required actions prominently within the interface. Use to communicate statuses, provide feedback, or draw attention to critical updates.

  ## Requirements

  Requires `OctantisEventProxy` hook. See Install Hooks README.

  ## Outside of a section

   Banners placed outside of a section will display in their own card and should be located at the top of the page. They're useful for conveying messages that apply to the entire page or areas not visible within the viewport, such as validation errors further down the page.

  ## In a section

  Banners placed inside a section will have styles applied contextually. They're useful for conveying messages relevant to a specific section or piece of content.

  ## Best practices

  - Seeing these banners can be stressful, so use them sparingly to avoid overwhelming users.
  - Focus on a single piece of information or required action to avoid overwhelming users.
  - Make the message concise and scannable. Users shouldn’t need to spend a lot of time figuring out what they need to know and do.
  - Info, Warning and Critical banners should contain a call to action and clear next steps. Users should know what to do after seeing the banner.
  - Avoid banners that can't be dismissed unless the user is required to take action.

  ## Example
  ```elixir
  <.s_banner heading="Order archived" tone="info" dismissible>
    This order was archived on March 7, 2017 at 3:12pm EDT.
  </.s_banner>
  ```

  ## See
  - https://shopify.dev/docs/api/app-home/polaris-web-components/feedback/banner
  """

  use OctantisWeb.Core, :web_component

  import OctantisWeb.Components.PolarisWC.SButton

  @doc @moduledoc

  ## Properties

  s_attr :id, :string,
    required: true,
    doc: """
    A unique identifier for the element.
    """

  s_attr :dismissible, :boolean,
    doc: """
    Determines whether the close button of the banner is present.

    When the close button is pressed, the `dismiss` event will fire, then `hidden` will be true, any animation will complete, and the `afterhide` event will fire.
    """

  s_attr :heading, :string,
    doc: """
    The title of the banner.
    """

  s_attr :hidden, :boolean,
    doc: """
    Determines whether the banner is hidden.

    If this property is being set on each framework render (as in 'controlled' usage), and the banner is `dismissible`, ensure you update app state for this property when the `dismiss` event fires.

    If the banner is not `dismissible`, it can still be hidden by setting this property.
    """

  s_attr :tone, :string,
    doc: """
    "info" | "success" | "warning" | "critical" | "auto"

    Sets the tone of the Banner, based on the intention of the information being conveyed.

    The banner is a live region and the type of status will be dictated by the Tone selected.

    - `critical` creates an [assertive live region](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/alert_role) that is announced by screen readers immediately.
    - `neutral`, `info`, `success`, `warning` and `caution` creates an [informative live region](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/status_role) that is announced by screen readers after the current message.
    """

  ## Events

  s_attr :afterhide, :event

  s_attr :dismiss, :string

  ## Slots

  slot :secondary_action,
    doc: """
    HTMLElement

    The secondary actions to display at the bottom of the banner.

    A maximum of two `s-button` components are allowed, and only buttons with the `variant` of "secondary" are permitted.
    """

  attr :rest, :global

  slot :inner_block

  def s_banner(assigns) do
    assigns = assigns |> assign_s_attrs() |> assign_s_attr_events()

    ~H"""
    <s-banner {@s_attrs} {@s_events} {@rest}>
      {render_slot(@inner_block)}
      <.s_button
        :for={button <- @secondary_action}
        {button}
        variant="secondary"
        slot="secondary-actions"
      >
        {render_slot(button)}
      </.s_button>
    </s-banner>
    """
  end
end
