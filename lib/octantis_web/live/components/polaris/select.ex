defmodule OctantisWeb.Components.Polaris.Select do
  @moduledoc """
  Select lets merchants choose one option from an options menu. Consider select when you have 4 or more options, to avoid cluttering the interface.

  ## Examples
  ```elixir
  <.select label="Date range" value="today">
    <:option value="today" label="Today"/>
    <:option value="yesterday" label="Yesterday"/>
    <:option value="lastWeek" label="Last 7 days" />
  </.select>
  ```

  ## See
   - https://polaris.shopify.com/components/selection-and-input/select
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Select/Select.tsx
  """

  use OctantisWeb.Core

  import_polaris_components([:box, :icon, :labelled, :text])

  alias OctantisWeb.Components.Polaris.Icons

  @doc @moduledoc

  attr :options, :list, default: [], doc: "List of options or option groups to choose from"

  attr :field, Phoenix.HTML.FormField, required: true, doc: "The Phoenix Form Field"

  attr :label, :string, default: nil, doc: "Label for the select"

  attr :label_action, :any, default: nil, doc: "Adds an action to the label"

  attr :label_hidden, :boolean, default: false, doc: "Visually hide the label"

  attr :label_inline, :boolean,
    default: false,
    doc: "Show the label to the left of the value, inside the control"

  attr :disabled, :boolean, default: false, doc: "Disable input"

  attr :help_text, :string, default: nil, doc: "Additional text to aide in use"

  attr :placeholder, :string, default: nil, doc: "Example text to display as placeholder"

  attr :id, :string, required: true, doc: "ID for form input"

  # attr :name, :string, default: nil, doc: "Name for form input"

  # attr :value, :string, doc: "Value for form input"

  attr :error, :string, default: nil, doc: "Display an error state"

  attr :phx_change, :any, default: nil, doc: "onChange: Callback when selection is changed"

  attr :phx_focus, :any, default: nil, doc: "onFocus: Callback when select is focused"

  attr :phx_blur, :any, default: nil, doc: "onBlur: Callback when focus is removed"

  attr :required_indicator, :boolean,
    default: false,
    doc: "Visual required indicator, add an asterisk to label"

  attr :tone, :string,
    values: ["magic", nil],
    default: nil,
    doc: "Indicates the tone of the select"

  def select(assigns) do
    assigns =
      assigns
      |> assign_phx_bindings()
      |> assign_described_by()
      |> assign_new(:error, &translate_errors(&1[:field]))

    ~H"""
    <.labelled
      id={@id}
      label={@label}
      error={@error}
      action={@label_action}
      label_hidden={@label_hidden || @label_inline}
      help_text={@help_text}
      required_indicator={@required_indicator}
      disabled={@disabled}
    >
      <div class={["Polaris-Select"]}>
        <select
          id={@id}
          name={@field.name}
          value={@field.value}
          class={["Polaris-Select__Input"]}
          disabled={!!@disabled}
          aria-invalid={!!@error}
          aria-describedby={@described_by}
          aria-required={@required_indicator}
          {@bindings}
        >
          {Phoenix.HTML.Form.options_for_select(@options, @field.value)}
        </select>
        <div class="Polaris-Select__Content" aria-hidden aria-disabled={!!@disabled}>
          <.box :if={@label_inline} padding_inline_end={[xs: "100"]}>
            <.text as="span" variant="bodyMd" truncate>
              {@label}
            </.text>
          </.box>
          <span class="Polaris-Select__SelectedOption">
            {value_label(@options, @field.value)}
          </span>
          <span class="Polaris-Select__Icon">
            <.icon><Icons.select /></.icon>
          </span>
        </div>
        <div class="Polaris-Select__Backdrop" />
      </div>
    </.labelled>
    """
  end

  defp assign_described_by(%{id: id} = assigns) do
    described_by = assigns |> Enum.flat_map(&build_described_by(&1, id)) |> Enum.join(" ")
    assign(assigns, :described_by, described_by)
  end

  def build_described_by({:error, value}, id) when not is_nil(value), do: [error_id(id)]
  def build_described_by({:help_text, value}, id) when not is_nil(value), do: [help_text_id(id)]
  def build_described_by({_key, _value}, _id), do: []

  defp error_id(id), do: id <> "Error"
  defp help_text_id(id), do: id <> "HelpText"

  # Finds the label for the value inside of the formats accepted by Form.options_for_select/2
  # E.g. ["Admin": "admin", "User": "user"]
  #      ["Admin": "admin", "User": "user"]
  #      ["Europe": ["UK", "Sweden", "France"], ...]
  defp value_label(options, value)
  defp value_label(options, value) when is_atom(value), do: value_label(options, to_string(value))
  defp value_label(value, value), do: value
  defp value_label({label, value}, value), do: label

  defp value_label({_label, options}, value) when is_list(options),
    do: value_label(options, value)

  defp value_label(options, value) when is_list(options),
    do: Enum.find_value(options, &value_label(&1, value))

  defp value_label(_option, _value), do: nil
end
