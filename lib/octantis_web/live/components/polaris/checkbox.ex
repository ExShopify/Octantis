defmodule OctantisWeb.Components.Polaris.Checkbox do
  @moduledoc """
  Skeleton display text is used to provide a low fidelity representation of content before it appears on the page, and improves load times perceived by merchants. Can be used for content in or outside of a card.

  ## Examples
  ```elixir
  <.checkbox id="checkbox-default-default" label="Checkbox label" name="checkbox"/>
  ```

  ## See
   - https://polaris.shopify.com/components/selection-and-input/checkbox
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Checkbox/Checkbox.tsx
  """

  use OctantisWeb.Core

  import_polaris_components(:choice)

  @doc @moduledoc

  attr :aria_controls, :string,
    default: nil,
    doc: "Indicates the ID of the element that is controlled by the checkbox"

  attr :aria_described_by, :string,
    default: nil,
    doc: "Indicates the ID of the element that describes the checkbox"

  attr :label, :string, required: true, doc: "Label for the checkbox"

  attr :label_hidden, :boolean, default: false, doc: "Visually hide the label"

  attr :checked, :boolean,
    default: false,
    doc: "Checkbox is selected. `indeterminate` shows a horizontal line in the checkbox"

  attr :disabled, :boolean, default: false, doc: "Disable input"

  attr :id, :string, doc: "ID for form input"

  attr :name, :string, required: true, doc: "Name for form input"

  attr :phx_click, :any, doc: "onClick: Callback when checkbox is clicked"

  attr :phx_change, :any, doc: "onChange: Callback when checkbox is toggled"

  # attr :phx_focus, ?(): void, doc: "onFocus: Callback when checkbox is focused"

  # attr :phx_blur, ?(): void, doc: "onBlur: Callback when focus is removed"

  attr :label_class, :string, doc: "Added to the wrapping label"

  attr :fill, :list, doc: "Grow to fill the space. Equivalent to width: 100%; height: 100%"

  attr :help_text, :string, doc: "Additional text to aide in use"

  attr :error, :string, doc: "Display an error message"

  attr :tone, :string, values: ["magic"], doc: "Indicates the tone of the checkbox"

  attr :phx_values, :list,
    default: [],
    doc:
      "A list of key value pairs to be passed as a value for actions. See assign_phx_bindings/2",
    examples: [[key: "value"]]

  attr :rest, :global

  def checkbox(assigns) do
    assigns =
      assigns
      |> assign_default_nil([
        :error,
        :help_text,
        :fill,
        :value,
        :tone,
        :phx_change,
        :phx_focus,
        :phx_blur,
        :phx_click
      ])
      |> assign(:class, class(assigns))
      |> assign(:input_class, input_class(assigns))
      |> assign(:label_class, label_class(assigns))
      |> assign_phx_bindings()

    ~H"""
    <.choice
      id={@id}
      label={@label}
      label_hidden={@label_hidden}
      disabled={@disabled}
      label_class={["Polaris-Checkbox__ChoiceLabel", @label_class] |> Enum.join(" ")}
      fill={@fill}
      tone={@tone}
      help_text={@help_text}
      {@rest}
    >
      <span class={["Polaris-Checkbox", @class]}>
        <input type="hidden" name={@name} value="false" />
        <input
          id={@id}
          name={@name}
          value="true"
          type="checkbox"
          checked={@checked}
          disabled={@disabled}
          class={["Polaris-Checkbox__Input", @input_class]}
          aria-invalid={!!@error}
          aria-controls={@aria_controls}
          aria-describedby={@aria_described_by}
          aria-checked={@checked}
          role="presentation"
          {@bindings}
        />
        <span class="Polaris-Checkbox__Backdrop"></span>
        <span class="Polaris-Checkbox__Icon Polaris-Checkbox--animated">
          <svg
            viewBox="0 0 16 16"
            shapeRendering="geometricPrecision"
            textRendering="geometricPrecision"
          >
            <path
              class={if @checked, do: "Polaris-Checkbox--checked"}
              d="M1.5,5.5L3.44655,8.22517C3.72862,8.62007,4.30578,8.64717,4.62362,8.28044L10.5,1.5"
              transform="translate(2 2.980376)"
              opacity="0"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
              pathLength="1"
            />
          </svg>
        </span>
      </span>
    </.choice>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:error, _value}), do: ["Polaris-Checkbox--error"]
  defp build_class({_key, _value}), do: []

  def input_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_input_class/1) |> Enum.join(" ")

  defp build_input_class({:tone, "magic"}), do: ["Polaris-Choice--toneMagic"]
  defp build_input_class({_key, _value}), do: []

  def label_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_label_class/1) |> Enum.join(" ")

  defp build_label_class({:tone, "magic"}), do: ["Polaris-Choice--toneMagic"]
  defp build_label_class({_key, _value}), do: []
end
