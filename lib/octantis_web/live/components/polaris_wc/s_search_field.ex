defmodule OctantisWeb.Components.PolarisWC.SSearchField do
  @moduledoc """
  Let users enter search terms or find specific items using a single-line input field.

  ## Requirements

  Requires `OctantisEventProxy` hook. See Install Hooks README.

  ## Example

  ```elixir
  <.s_search_field
    label="Search"
    label_accessibility_visibility="exclusive"
    placeholder="Search items"
  />
  ```

  ## See

  - https://shopify.dev/docs/api/app-home/polaris-web-components/forms/searchfield
  """

  use OctantisWeb.Core, :web_component

  @doc @moduledoc

  s_attr :autocomplete, :string,
    doc: """
    A hint as to the intended content of te field.

    When set to `on` (the default), this property indicates that the field should support autofill, but you do not have any more semantic information on the intended contents.

    When set to `off`, you are indicating that this field contains sensitive information, or contents that are never saved, like one-time codes.

    Alternatively, you can provide value which describes the specific data you would like to be entered into this field during autofill.
    """

  s_attr :default_value, :string,
    doc: """
    The default value for the field.
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

  s_attr :error, :string,
    doc: """
    Indicate an error to the user. The field will be given a specific stylistic treatment to communicate problems that have to be resolved immediately.
    """

  s_attr :id, :string,
    required: true,
    doc: """
    A unique identifier for the element.
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

  s_attr :max_length, :integer,
    doc: """
    Specifies the maximum number of characters allowed.
    """

  s_attr :min_length, :integer,
    doc: """
    Specifies the min number of characters allowed.
    """

  s_attr :placeholder, :string,
    doc: """
    A short hint that describes the expected value of the field.
    """

  s_attr :read_only, :boolean,
    doc: """
    The field cannot be edited by the user. It is focusable will be announced by screen readers.
    """

  s_attr :required, :boolean,
    doc: """
    Whether the field needs a value. This requirement adds semantic value to the field, but it will not cause an error to appear automatically. If you want to present an error when this field is empty, you can do so with the `error` property.
    """

  s_attr :value, :string,
    doc: """
    The current value for the field. If omitted, the field will be empty.
    """

  attr :field, Phoenix.HTML.FormField, required: true, doc: "The Phoenix Form Field"

  ## Events

  s_attr :blur, :event
  s_attr :change, :event
  s_attr :focus, :event
  s_attr :input, :event

  attr :rest, :global

  slot :inner_block

  def s_search_field(assigns) do
    assigns =
      assigns
      |> assign_s_attrs()
      |> assign_s_attr_events()
      |> assign_field_values()

    ~H"""
    <s-search-field {@s_attrs} {@s_events} {@field_values} {@rest}>
      {render_slot(@inner_block)}
    </s-search-field>
    <input id={"OctantisHiddenInput" <> @id} {@field_values} hidden />
    """
  end
end
