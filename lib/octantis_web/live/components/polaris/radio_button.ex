defmodule OctantisWeb.Components.Polaris.RadioButton do
  @moduledoc """
  Use radio buttons to present each item in a list of options where merchants must make a single selection.

  Must be inside of a '.form'

  ## Examples
  ```elixir
  <.form>
    <.radio_button label="Accounts are disabled" name="accounts" help_text="Customers will only be able to check out as guests."/>
    <.radio_button label="Accounts are optional" name="accounts" checked help_text="Customers will be able to check out with a customer account or as a guest."/>
  </.form>
  ```

  ## See
   - https://polaris.shopify.com/components/selection-and-input/radio-button
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/RadioButton/RadioButton.tsx
  """

  use OctantisWeb.Core, :component

  import_polaris_components([:choice])

  @doc @moduledoc

  attr :aria_described_by, :string,
    default: nil,
    doc: "Indicates the ID of the element that describes the radio button"

  attr :label, :string, default: nil, doc: "Label for the radio button"

  attr :label_hidden, :boolean, default: false, doc: "Visually hide the label"

  attr :checked, :boolean, default: false, doc: "Radio button is selected"

  attr :disabled, :boolean, default: false, doc: "Disable input"

  attr :id, :string, default: nil, doc: "ID for form input"

  attr :name, :string, default: nil, doc: "Name for form input"

  attr :value, :string, default: nil, doc: "Value for form input"

  attr :fill, :list,
    default: nil,
    doc: "Grow to fill the space. Equivalent to width: 100%; height: 100%"

  attr :help_text, :string, default: nil, doc: "Additional text to aide in use"

  attr :tone, :string,
    values: ["magic", nil],
    default: nil,
    doc: "Indicates the tone of the text field"

  # attr :on_change?(newValue: boolean, id: string): void, default: nil,
  # doc: "Callback when the radio button is toggled"

  attr :phx_focus, :any, default: nil, doc: "onFocus: Callback when radio button is focused"

  attr :phx_blur, :any, default: nil, doc: "onBlur: Callback when focus is removed"

  def radio_button(assigns) do
    assigns =
      assigns
      |> assign(:input_class, input_class(assigns))
      |> assign_phx_bindings()

    ~H"""
    <.choice
      label={@label}
      label_hidden={@label_hidden}
      disabled={@disabled}
      id={@id}
      label_class="Polaris-RadioButton__ChoiceLabel"
      fill={@fill}
      tone={if @checked, do: @tone}
      help_text={@help_text}
    >
      <span class="Polaris-RadioButton">
        <input
          id={@id}
          name={@name}
          value={@value}
          type="radio"
          checked={@checked}
          disabled={@disabled}
          class={["Polaris-RadioButton__Input", @input_class]}
          aria-describedby={@aria_described_by}
          {@bindings}
        />
        <span class="Polaris-RadioButton__Backdrop" />
      </span>
    </.choice>
    """
  end

  def input_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_input_class/1) |> Enum.join(" ")

  defp build_input_class({:tone, value}) when is_binary(value),
    do: ["Polaris-RadioButton--tone#{Macro.camelize(value)}"]

  defp build_input_class({_key, _value}), do: []
end
