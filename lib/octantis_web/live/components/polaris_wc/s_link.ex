defmodule OctantisWeb.Components.PolarisWC.SLink do
  @moduledoc """
  Makes text interactive, allowing users to navigate to other pages or perform specific actions. Supports standard URLs, custom protocols, and navigation within Shopify or app pages.

  ## Example

  ```elixir
  <.s_link href="#beep">fufilling orders</.s_link>
  ```

  ## See

  - http://shopify.dev/docs/api/app-home/polaris-web-components/actions/link
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_label, :string,
    doc: """
    A label that describes the purpose or contents of the Link. It will be read to users using assistive technologies such as screen readers.

    Use this when using only an icon or the content of the link is not enough context for users using assistive technologies.
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
    Sets the element the [commandFor](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#commandfor) should act on when this clickable is activated.
    """

  s_attr :download, :string,
    doc: """
    Causes the browser to treat the linked URL as a download with the string being the file name. Download only works for same-origin URLs or the `blob:` and `data:` schemes.
    """

  s_attr :href, :string,
    doc: """
    The URL to link to.

    - If set, it will navigate to the location specified by `href` after executing the `click` event.
    - If a `commandFor` is set, the `command` will be executed instead of the navigation.
    """

  s_attr :interest_for, :string,
    doc: """
    Sets the element the [interestFor](https://open-ui.org/components/interest-invokers.explainer/#the-pitch-in-code) should act on when this clickable is activated.
    """

  s_attr :lang, :string,
    doc: """
    Indicate the text language. Useful when the text is in a different language than the rest of the page. It will allow assistive technologies such as screen readers to invoke the correct pronunciation. [Reference of values](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry) ("subtag" label)
    """

  s_attr :target, :string,
    doc: """
    "auto" | AnyString | "\_blank" | "\_self" | "\_parent" | "\_top"

    Specifies where to display the linked URL.
    """

  s_attr :tone, :string,
    doc: """
    "critical" | "auto" | "neutral"

    Sets the tone of the Link, based on the intention of the information being conveyed.
    """

  ## Events

  s_attr :click, :event

  attr :rest, :global

  slot :inner_block

  def s_link(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-link {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-link>
    """
  end
end
