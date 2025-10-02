defmodule OctantisWeb.Components.PolarisWC.SModal do
  @moduledoc """
  Displays content in an overlay. Use to create a distraction-free experience such as a confirmation dialog or a settings panel.

  ## Example

  ```elixir
  <.s_button command_for="modal">
    Open
  </.s_button>
  <.s_modal id="modal" heading="Details">
    <.s_paragraph>
      Displaying more details here.
    </.s_paragraph>
    <:secondary_action command_for="modal" command="--hide">Close</.secondary_action>
    <:primary_action command_for="modal" command="--hide">Save</:primary_action>
  </.s_modal>
  ```

  ## See

  - https://shopify.dev/docs/api/app-home/polaris-web-components/overlays/modal
  """

  use OctantisWeb.Core, :web_component

  import OctantisWeb.Components.PolarisWC.SButton

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_label, :string,
    doc: """
    A label that describes the purpose of the modal. When set, it will be announced to users using assistive technologies and will provide them with more context.

    This overrides the `heading` prop for screen readers.
    """

  s_attr :heading, :string,
    doc: """
    A title that describes the content of the Modal.
    """

  s_attr :hide_overlay, :string,
    doc: """
    () => void

    Method to hide an overlay.
    """

  s_attr :padding, :string,
    doc: """
    "base" | "none"

    Adjust the padding around the Modal content.

    `base`: applies padding that is appropriate for the element.

    `none`: removes all padding from the element. This can be useful when elements inside the Modal need to span to the edge of the Modal. For example, a full-width image. In this case, rely on `Box` with a padding of 'base' to bring back the desired padding for the rest of the content.
    """

  s_attr :show_overlay, :string,
    doc: """
    () => void

    Method to show an overlay.
    """

  s_attr :size, :string,
    doc: """
    "small" | "small-100" | "base" | "large" | "large-100"

    Adjust the size of the Modal.
    """

  s_attr :toggle_overlay, :string,
    doc: """
    () => void

    Method to toggle the visiblity of an overlay.
    """

  ## Events

  s_attr :afterhide, :event
  s_attr :aftershow, :event
  s_attr :hide, :event
  s_attr :show, :event

  ## Slots

  slot :primary_action,
    doc: """
        The primary action to perform.

        Only a `Button` with a variant of `primary` is allowed.
    """

  slot :secondary_action,
    doc: """
    The secondary actions to perform.

    Only `ButtonGroup` or `Button` with a variant of `secondary` or `auto` are allowed.
    """

  attr :rest, :global

  slot :inner_block

  def s_modal(assigns) do
    assigns = assigns |> assign_s_attrs() |> assign_s_attr_events()

    ~H"""
    <s-modal {@s_attrs} {@s_events} {@rest}>
      {render_slot(@inner_block)}
      <.s_button :for={button <- @primary_action} {button} slot="primary-action" variant="primary">
        {render_slot(button)}
      </.s_button>
      <.s_button
        :for={button <- @secondary_action}
        {button}
        variant="secondary"
        slot="secondary-actions"
      >
        {render_slot(button)}
      </.s_button>
    </s-modal>
    """
  end
end
