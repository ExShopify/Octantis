defmodule OctantisWeb.Components.Polaris.Labelled do
  @moduledoc """
  Skeleton display text is used to provide a low fidelity representation of content before it appears on the page, and improves load times perceived by merchants. Can be used for content in or outside of a card.

  ## Examples
  ```elixir
  </.labelled>
  ```

  ## See
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Labelled/Labelled.tsx
  """

  use OctantisWeb.Core

  import_polaris_components([:inline_error, :text])

  @doc @moduledoc

  attr :id, :string, doc: "A unique identifier for the label"

  attr :label, :string, required: true, doc: "Text for the label"

  attr :error, :string, default: nil, doc: "Error to display beneath the label"

  attr :action, :any, default: false, doc: "An action"

  attr :help_text, :string, default: nil, doc: "Additional hint text to display"

  attr :label_hidden, :boolean, default: false, doc: "Visually hide the label"

  attr :required_indicator, :boolean,
    default: false,
    doc: "Visual required indicator for the label"

  attr :disabled, :boolean, default: false, doc: "Labels signify a disabled control"

  attr :read_only, :boolean, default: false, doc: "Labels signify a readOnly control"

  slot :inner_block, required: true, doc: "Content to display inside the connected"

  attr :rest, :global

  def labelled(assigns) do
    assigns =
      assigns
      |> assign_new(:id, fn %{label: label} -> "Labelled" <> label end)
      |> assign(:class, class(assigns))
      |> assign(:style, build_style(assigns))

    ~H"""
    <div class={@class}>
      <div class="Polaris-Labelled__LabelWrapper">
        <.label id={@id} required_indicator={@required_indicator} {@rest} hidden={false}>
          {@label}
        </.label>
        <%!-- {actionMarkup} --%>
      </div>
      {render_slot(@inner_block)}
      <div :if={@error} class="Polaris-Labelled__Error">
        <.inline_error message={@error} field_id={@id} />
      </div>
      <div
        :if={@help_text}
        class="Polaris-Labelled__HelpText"
        id={help_text_id(@id)}
        aria-disabled={@disabled}
      >
        <.text as="span" tone="subdued" variant="bodyMd" break_word>
          {@help_text}
        </.text>
      </div>
    </div>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:disabled, value}) when value not in [nil, false],
    do: ["Polaris-Labelled--disabled"]

  defp build_class({:label_hidden, value}) when value not in [nil, false],
    do: ["Polaris-Labelled--hidden"]

  defp build_class({:read_only, value}) when value not in [nil, false],
    do: ["Polaris-Labelled--readOnly"]

  defp build_class({_key, _value}), do: []

  def build_style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&style/1) |> Enum.join(" ")

  def style({_key, _value}), do: []

  attr :id, :string, doc: "A unique identifier for the label"

  attr :hidden, :boolean, default: false, doc: "Visually hide the label"

  attr :required_indicator, :boolean,
    default: false,
    doc: "Visual required indicator for the label"

  slot :inner_block, required: true, doc: "Label content"

  def label(assigns) do
    assigns =
      assigns
      |> assign(:label_class, label_class(assigns))
      |> assign(:label_text_class, label_text_class(assigns))

    ~H"""
    <div class={["Polaris-Label", @label_class]}>
      <label id={label_id(@id)} htmlFor={@id} class={["Polaris-Label__Text", @label_text_class]}>
        <.text as="span" variant="bodyMd">
          {render_slot(@inner_block)}
        </.text>
      </label>
    </div>
    """
  end

  def label_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_label_class/1) |> Enum.join(" ")

  defp build_label_class({:hidden, true}), do: ["Polaris-Label--hidden"]
  defp build_label_class({_key, _value}), do: []

  def label_text_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_label_text_class/1) |> Enum.join(" ")

  defp build_label_text_class({:required_indicator, true}),
    do: ["Polaris-Label__RequiredIndicator"]

  defp build_label_text_class({_key, _value}), do: []

  defp label_id(id), do: id <> "Label"
  defp help_text_id(id), do: id <> "HelpText"
end
