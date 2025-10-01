defmodule OctantisWeb.Components.PolarisWC.SButton do
  @moduledoc """
  Triggers actions or events, such as submitting forms, opening dialogs, or navigating to other pages. Use Button to let users perform specific tasks or initiate interactions throughout the interface. Buttons can also function as links, guiding users to internal or external destinations.

  ## Requirements

  Requires `OctantisEventProxy` hook. See Install Hooks README.

  ## See

  - https://shopify.dev/docs/api/app-home/polaris-web-components/actions/button
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
    A label that describes the purpose or contents of the Button. It will be read to users using assistive technologies such as screen readers.

    Use this when using only an icon or the button text is not enough context for users using assistive technologies.
    """

  s_attr :command, :command,
    doc: """
    Sets the action the command should take when this clickable is activated.

    See the documentation of particular components for the actions they support.

        --auto: a default action for the target component.
        --show: shows the target component.
        --hide: hides the target component.
        --toggle: toggles the target component.
    """

  s_attr :command_for, :string,
    doc: """
    Sets the element the commandFor should act on when this clickable is activated.
    """

  s_attr :disabled, :boolean,
    doc: """
    Disables the button, meaning it cannot be clicked or receive focus.
    """

  s_attr :download, :string,
    doc: """
    Causes the browser to treat the linked URL as a download with the string being the file name. Download only works for same-origin URLs, or the blob: and data: schemes.
    """

  s_attr :href, :string,
    doc: """
    The URL to link to.

        If set, it will navigate to the location specified by href after executing the click event.
        If a commandFor is set, the command will be executed instead of the navigation.
    """

  s_attr :icon, :icon,
    doc: """
    The type of icon to be displayed in the button.
    """

  s_attr :interest_for, :string,
    doc: """
    Sets the element the interestFor should act on when this clickable is activated.
    """

  s_attr :loading, :boolean,
    doc: """
    Replaces content with a loading indicator while a background action is being performed.

    This also disables the button.
    """

  s_attr :target, :target,
    doc: """
    Specifies where to display the linked URL.
    """

  s_attr :tone, :tone,
    doc: """
    Sets the tone of the Button, based on the intention of the information being conveyed.
    """

  s_attr :type, :string,
    values: ["button", "reset", "submit"],
    doc: """
    The behavior of the button.

        submit: Used to indicate the component acts as a submit button, meaning it submits the closest form.
        button: Used to indicate the component acts as a button, meaning it has no default action.
        reset: Used to indicate the component acts as a reset button, meaning it resets the closest form (returning fields to their default values).

    This property is ignored if the component supports href or commandFor/command and one of them is set.
    """

  s_attr :variant, :variant,
    doc: """
    "auto" | "primary" | "secondary" | "tertiary"

    Changes the visual appearance of the Button.
    """

  ## Events

  s_attr :blur, :event
  s_attr :click, :event
  s_attr :focus, :event

  attr :rest, :global, include: ~w(slot)

  slot :inner_block

  def s_button(assigns) do
    assigns = assigns |> assign_s_attrs() |> assign_s_attr_events()

    ~H"""
    <s-button {@s_attrs} {@s_events} {@rest}>{render_slot(@inner_block)}</s-button>
    """
  end
end
