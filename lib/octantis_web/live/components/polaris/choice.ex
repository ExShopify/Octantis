defmodule OctantisWeb.Components.Polaris.Choice do
  @moduledoc """
  Consumed by Checkbox and Radio button.
  Undocumented by Shopify.

  ## See
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Choice/Choice.tsx
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Collapsible/Collapsible.tsx
  """

  use OctantisWeb.Core, :component

  import_polaris_components([:text, :inline_error])

  import OctantisWeb.Core
  require OctantisWeb.Core

  @doc @moduledoc

  attr :id, :string, doc: "A unique identifier for the choice"

  attr :label, :string, doc: "Label for the choice"

  attr :disabled, :boolean, doc: "Whether the associated form control is disabled"

  attr :label_hidden, :boolean, doc: "Visually hide the label"

  # attr      :onClick, ): void,, doc: "Callback when clicked"

  attr :label_class, :string, default: nil, doc: "Added to the label element"

  attr :fill, :list,
    default: nil,
    doc: "Grow to fill the space. Equivalent to width: 100%; height: 100%"

  attr :error, :string, doc: "Display an error message"

  attr :help_text, :string, doc: "Additional text to aide in use. Will add a wrapping <div>"

  attr :tone, :string,
    values: ["magic", nil],
    default: nil,
    doc: "Indicates the tone of the choice"

  slot :inner_block, doc: " Content to display inside the choice"

  def choice(assigns) do
    assigns =
      assigns
      |> assign(:class, class(assigns))
      |> assign_new(:error, fn -> nil end)
      |> assign_new(:help_text, fn -> nil end)
      |> assign_new(:on_click, fn -> nil end)

    ~H"""
    <.div_wrapper wrap={@error || @help_text}>
      <label class={["Polaris-Choice", @label_class, @class]} htmlFor={@id} onClick={@on_click}>
        <span class="Polaris-Choice__Control">{render_slot(@inner_block)}</span>
        <span class="Polaris-Choice__Label">
          <.text as="span" variant="bodyMd">
            {@label}
          </.text>
        </span>
      </label>
      <div :if={@error || @help_text} class="Polaris-Choice__Descriptions">
        <div :if={@error} class="Polaris-Choice__Error">
          <.inline_error message={@error} field_id={@id} />
        </div>
        <div :if={@help_text} class="Polaris-Choice__HelpText" id={if @id, do: @id <> "HelpText"}>
          <.text as="span" tone={if @disabled, do: "subdued"}>
            {@help_text}
          </.text>
        </div>
      </div>
    </.div_wrapper>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  def build_class({:label_hidden, true}), do: ["Polaris-Choice--labelHidden"]
  def build_class({_, _}), do: []
end
