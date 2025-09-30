defmodule OctantisWeb.Components.PolarisWC.SButtonGroup do
  @moduledoc """
  Displays multiple buttons in a layout.

   ```elixir
    <.s_button_group>
      <:s_button_primary>Save</:s_button>
      <:s_button_secondary>Cancel</:s_button>
    </.s_button_group>
    ```

  See
  - http://shopify.dev/docs/api/app-home/polaris-web-components/actions/buttongroup
  """
  use OctantisWeb.Core, :web_component

  import OctantisWeb.Components.PolarisWC.SButton

  @doc @moduledoc

  ## Properties

  s_attr :accessibility_label, :string,
    doc: """
      string

      Label for the button group that describes the content of the group for screen reader users to understand what's included.
    """

  s_attr :gap, :string,
    doc: """
      "base" | "none"

      The gap between elements.
    """

  ## Slots

  slot :s_button_primary,
    doc: """
      primary-action
      The primary action button for the group. Accepts a single Button element with a `variant` of `primary`. Cannot be used when gap="none".
    """

  slot :s_button_secondary,
    doc: """
      secondary-actions
      Secondary action buttons for the group. Accepts Button elements with a `variant` of `secondary` or `auto`.
    """

  attr :rest, :global

  slot :inner_block

  def s_button_group(assigns) do
    assigns = assigns |> assign_s_attrs()

    ~H"""
    <s-button-group {@s_attrs} {@rest}>
      <.s_button :for={button <- @s_button_primary} {button} variant="primary" slot="primary-action">
        {render_slot(button)}
      </.s_button>
      <.s_button
        :for={button <- @s_button_secondary}
        {button}
        variant="secondary"
        slot="secondary-actions"
      >
        {render_slot(button)}
      </.s_button>
    </s-button-group>
    """
  end
end
