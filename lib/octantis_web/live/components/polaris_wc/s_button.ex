defmodule OctantisWeb.Components.PolarisWC.SButton do
  @moduledoc """
  Triggers actions or events, such as submitting forms, opening dialogs, or navigating to other pages. Use Button to let users perform specific tasks or initiate interactions throughout the interface. Buttons can also function as links, guiding users to internal or external destinations.

  See:
  - https://shopify.dev/docs/api/app-home/polaris-web-components/structure/divider
  """
  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :id, :string

  s_attr :accessibility_label, :string,
    doc: ~S"""
    A label that describes the purpose or contents of the Button. It will be read to users using assistive technologies such as screen readers.

    Use this when using only an icon or the button text is not enough context for users using assistive technologies.
    """

  s_attr :command, :command,
    doc: ~S"""
    Sets the action the command should take when this clickable is activated.

    See the documentation of particular components for the actions they support.

        --auto: a default action for the target component.
        --show: shows the target component.
        --hide: hides the target component.
        --toggle: toggles the target component.
    """

  s_attr :command_for, :string,
    doc: ~S"""
    Sets the element the commandFor should act on when this clickable is activated.
    """

  s_attr :disabled, :boolean,
    doc: ~S"""
    Disables the button, meaning it cannot be clicked or receive focus.
    """

  s_attr :download, :string,
    doc: ~S"""
    Causes the browser to treat the linked URL as a download with the string being the file name. Download only works for same-origin URLs, or the blob: and data: schemes.
    """

  s_attr :href, :string,
    doc: ~S"""
    The URL to link to.

        If set, it will navigate to the location specified by href after executing the click event.
        If a commandFor is set, the command will be executed instead of the navigation.
    """

  s_attr :icon, :icon,
    doc: ~S"""
    The type of icon to be displayed in the button.
    """

  s_attr :interest_for, :string,
    doc: ~S"""
    Sets the element the interestFor should act on when this clickable is activated.
    """

  s_attr :loading, :boolean,
    doc: ~S"""
    Replaces content with a loading indicator while a background action is being performed.

    This also disables the button.
    """

  s_attr :target, :target,
    doc: ~S"""
    Specifies where to display the linked URL.
    """

  s_attr :tone, :tone,
    doc: ~S"""
    Sets the tone of the Button, based on the intention of the information being conveyed.
    """

  s_attr :type, :string,
    values: ["button", "reset", "submit"],
    doc: ~S"""
    The behavior of the button.

        submit: Used to indicate the component acts as a submit button, meaning it submits the closest form.
        button: Used to indicate the component acts as a button, meaning it has no default action.
        reset: Used to indicate the component acts as a reset button, meaning it resets the closest form (returning fields to their default values).

    This property is ignored if the component supports href or commandFor/command and one of them is set.
    """

  s_attr :variant, :variant,
    doc: ~S"""
    Changes the visual appearance of the Button.
    """

  ## Events

  s_attr :blur, :event
  s_attr :click, :event
  s_attr :focus, :event

  attr :rest, :global

  slot :inner_block

  def s_button(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-button {@s_attrs} {@rest}>{render_slot(@inner_block)}</s-button>
    """
  end
end
