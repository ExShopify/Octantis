defmodule OctantisWeb.Components.Polaris.ChoiceList do
  @moduledoc """
  A choice list lets you create a list of grouped radio buttons or checkboxes. Use this component if you need to group together a related list of interactive choices.

  ## Examples
  ```elixir
  <.choice_list name="checkout" title="While the customer is checking out" allow_multiple>
    <:choice label="Choice A" value="a"/>
    <:choice label="Choice B" value="b"/>
    <:choice label="Choice C" value="c"/>
  </.choice_list>
  ```

  ```elixir
  <.choice_list label="Status" name={f[:status].name} allow_multiple={false}>
    <:choice
      :for={choice <- Ecto.Enum.dump_values(Schema.Section, :status)}
      label={choice |> Macro.camelize()}
      value={choice}
      selected={f[:status].value == String.to_atom(choice)}
    />
  </.choice_list>
  ```

  ## See
   - https://polaris.shopify.com/components/selection-and-input/choice-list
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/ChoiceList/ChoiceList.tsx
  """

  use OctantisWeb.Core

  import_polaris_components([
    :bleed,
    :block_stack,
    :box,
    :checkbox,
    :inline_error,
    :radio_button,
    :text
  ])

  alias Phoenix.HTML.FormField

  @doc @moduledoc

  attr :id, :string

  attr :field, FormField, default: nil, doc: "The Phoenix Form Field"

  attr :title, :string, doc: "Label for list of choices"

  # attr   :selected: string[], doc: "Collection of selected choices"

  attr :name, :string, doc: "Name for form input"

  attr :allow_multiple, :boolean,
    default: true,
    doc: "Allow merchants to select multiple options at once"

  attr :title_hidden, :boolean, default: false, doc: "Toggles display of the title"

  attr :error, :string, doc: "Display an error message"

  attr :disabled, :boolean, default: false, doc: "Disable all choices"

  attr :phx_click, :any, default: nil, doc: "onClick: Callback when the choices are clicked"

  attr :phx_change, :any, default: nil, doc: "onChange: Callback when the selected choices change"

  attr :tone, :string,
    default: nil,
    values: ["magic", nil],
    doc: "Indicates the tone of the choice list"

  slot :choice, doc: "Collection of choices" do
    attr :value, :string, doc: "Value of the choice"
    attr :label, :string, doc: "Label for the choice"
    attr :id, :string, doc: "A unique identifier for the choice"
    attr :disabled, :boolean, doc: "Disable choice"
    attr :help_text, :string, doc: "Additional text to aide in use"
    attr :selected, :string, doc: "The choice is selected"

    attr :described_by_error, :boolean,
      doc: "Indicates that the choice is aria-describedBy the error message"

    # attr :render_children?(isSelected: boolean): React.ReactNode | false,
    #   doc: " Method to render children with a choice"
  end

  def choice_list(assigns) do
    assigns =
      assigns
      |> assign_id()
      |> assign_new_from_field()

    ~H"""
    <.block_stack as="fieldset" gap={[xs: "400", md: "0"]} aria-invalid={!!@error} id={@id}>
      <.box :if={@title} as="legend" padding_block_end={[xs: "0", md: "100"]}>
        <.text as="span" variant="bodyMd" visually_hidden={@title_hidden}>
          {@title}
        </.text>
      </.box>
      <.block_stack as="ul" gap={[xs: "400", md: "0"]}>
        <li :for={choice <- @choice} key={choice.value}>
          <.bleed margin_block_end={if choice[:help_text], do: [xs: "100", md: "0"], else: [xs: "0"]}>
            <.as
              element={if @allow_multiple, do: "checkbox", else: "radio_button"}
              name={@name}
              value={choice[:value]}
              id={choice[:id]}
              label={choice[:label]}
              disabled={choice[:disabled] || @disabled}
              fill={[xs: true, sm: false]}
              checked={choice[:selected]}
              help_text={choice[:help_text]}
              aria_described_by={
                if @error && choice[:described_by_error], do: @id <> "Error", else: nil
              }
              phx_change={@phx_change}
              phx_click={@phx_click}
              phx_values={[
                name: @name,
                label: choice[:label],
                choice: choice[:value],
                checked: choice[:selected]
              ]}
              tone={@tone}
            />
          </.bleed>
        </li>
      </.block_stack>
      <.box :if={@error} padding_block_start={[xs: "0", md: "100"]} padding_block_end={[xs: "200"]}>
        <.inline_error message={@error} field_id={@id} />
      </.box>
    </.block_stack>
    """
  end

  @doc """
  A helper for setting the underlaying element of a component
  """
  attr :element, :string,
    values: ["checkbox", "radio_button"],
    required: true

  attr :rest, :global,
    include:
      ~w(name value id label disabled fill checked help_text aria_described_by phx_change phx_click phx_values tone)

  def as(%{element: "checkbox"} = assigns),
    do: ~H"<.checkbox {@rest} />"

  def as(%{element: "radio_button"} = assigns),
    do: ~H"<.radio_button {@rest} />"

  def assign_new_from_field(assigns = %{field: field}) when is_struct(field, FormField) do
    title = field.field |> Atom.to_string() |> Macro.camelize()

    assigns
    |> assign_new(:title, fn -> title end)
    |> assign_new(:name, & &1[:field].name)
    |> assign_new(:error, &translate_errors(&1[:field]))
  end

  def assign_new_from_field(%{field: nil} = assigns),
    do: assigns |> assign_default_nil([:title, :name, :error])

  def assign_id(%{field: field} = assigns) when is_struct(field, FormField),
    do: assigns |> assign_new(:id, fn -> "ChoiceList" <> field.id end)

  def assign_id(%{name: name} = assigns),
    do: assigns |> assign_new(:id, fn -> "ChoiceList" <> to_string(name) end)
end
