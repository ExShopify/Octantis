defmodule OctantisWeb.Components.PolarisWC.SSelect do
  @moduledoc """
  Allow users to pick one option from a menu. Ideal when presenting four or more choices to keep interfaces uncluttered.

  ## Requirements

  Requires `OctantisEventProxy` hook. See Install Hooks README.

  ## Example

   ```elixir
    <.s_select label="Date range">
      <:s_option value="1">Today</:s_option>
      <:s_option value="2">Yesterday</:s_option>
      <:s_option value="3">Last 7 days</:s_option>
    </.s_select>
    ```

  ## Unimplemented

  `<s-group-options />` is not currently implemented. Unsure what that would look like.

  ## See

  - https://shopify.dev/docs/api/app-home/polaris-web-components/forms/select
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  ## Properties

  s_attr :id, :string,
    required: true,
    doc: """
    A unique identifier for the element.
    """

  s_attr :details, :string,
    doc: """

    Additional text to provide context or guidance for the field. This text is displayed along with the field and its label to offer more information or instructions to the user.

    This will also be exposed to screen reader users.
    """

  s_attr :disabled, :boolean,
    doc: """
    Disables the field, disallowing any interaction.
    """

  s_attr :icon, :icon,
    doc: """
      "" | "replace" | "search" | "link" | "product" | "variant" | "collection" | "select" | "info" | "incomplete" | "complete" | "color" | "money" | "adjust" | "affiliate" | "airplane" | "alert-bubble" | "alert-circle" | "alert-diamond" | "alert-location" | "alert-octagon" | "alert-octagon-filled" | "alert-triangle" | "alert-triangle-filled" | "app-extension"

      The type of icon to be displayed in the field.
    """

  s_attr :label, :string,
    doc: """
      Content to use as the field label.
    """

  s_attr :label_accessibility_visibility, :string,
    doc: """
    "visible" | "exclusive"

    Changes the visibility of the component's label.

    - `visible`: the label is visible to all users.
    - `exclusive`: the label is visually hidden but remains in the accessibility tree.
    """

  s_attr :placeholder, :string,
    doc: """
    A short hint that describes the expected value of the field.
    """

  s_attr :required, :boolan,
    doc: """
    Whether the field needs a value. This requirement adds semantic value to the field, but it will not cause an error to appear automatically. If you want to present an error when this field is empty, you can do so with the `error` property.
    """

  ## Events

  s_attr :change, :event,
    doc: """
      CallbackEventListener<'input'>
    """

  s_attr :input, :event,
    doc: """
      CallbackEventListener<'input'>
    """

  attr :field, Phoenix.HTML.FormField, doc: "The Phoenix Form Field", required: true

  ## Slots

  slot :s_option,
    doc: """
      Represents a single option within a select component. Use only as a child of `s-select` components.
    """ do
    attr :default_selected, :boolean,
      doc: """
      Whether the control is active by default.
      """

    attr :disabled, :boolean,
      doc: """
      Disables the control, disallowing any interaction.
      """

    attr :selected, :boolean,
      doc: """
      Whether the control is active.
      """

    attr :value, :string,
      doc: """
      The value used in form data when the control is checked.
      """
  end

  attr :rest, :global

  slot :inner_block

  def s_select(assigns) do
    assigns =
      assigns
      |> assign_s_attrs()
      |> assign_s_attr_events()
      |> assign_field_values()

    ~H"""
    <s-select {@s_attrs} {@s_events} {@field_values} {@rest}>
      {render_slot(@inner_block)}
      <s-option
        :for={s_option <- @s_option}
        {Map.take(s_option, [:value, :selected, :default_selected, :disabled])}
      >
        {render_slot(s_option)}
      </s-option>
    </s-select>
    <input id={"OctantisHiddenInput" <> @id} {@field_values} hidden />
    """
  end
end
