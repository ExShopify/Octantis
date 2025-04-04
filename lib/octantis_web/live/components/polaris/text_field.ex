defmodule OctantisWeb.Components.Polaris.TextField do
  @moduledoc """
  A text field is an input field that merchants can type into. It has a range of options and supports several text formats including numbers.

  Must be wrapped in a form component.

  ## Examples
    ```elixir
    <.form ... >
      <.text_field label="Search"/>
    </.form>
    ```

  See
   - https://polaris.shopify.com/components/selection-and-input/text-field
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/TextField/TextField.tsx
  """

  use OctantisWeb.Core

  alias OctantisWeb.Components.Polaris.Icons

  import_polaris_components([:labelled, :spinner, :text, :icon])

  @doc @moduledoc
  attr :prefix, :string, default: nil, doc: "Text to display before value"
  attr :suffix, :string, default: nil, doc: "Text to display after value"

  # attr :vertical_content, :React.ReactNode, doc: "Content to vertically display above the input value"
  attr :placeholder, :string, default: nil, doc: "Hint text to display"
  attr :field, Phoenix.HTML.FormField, required: true, doc: "The Phoenix Form Field"
  attr :help_text, :string, default: nil, doc: "Additional hint text to display"
  attr :label, :string, doc: "Label for the input"
  attr :label_action, :any, default: nil, doc: "Adds an action to the label"
  attr :label_hidden, :boolean, default: false, doc: "Visually hide the label"
  attr :disabled, :boolean, default: false, doc: "Disable the input"

  attr :clear_button, :boolean, default: false, doc: "Show a clear text button in the input"

  # attr :select_text_on_focus, :boolean, doc: "Indicates whether or not the entire value should be selected on focus."

  attr :suggestion, :string,
    default: nil,
    doc:
      "An inline autocomplete suggestion containing the input value. The characters that complete the input value are selected for ease of deletion on input change or keypress of Backspace/Delete. The selected substring is visually highlighted with subdued styling."

  attr :read_only, :boolean, default: false, doc: "Disable editing of the input"
  attr :auto_focus, :boolean, default: false, doc: "Automatically focus the input"
  attr :focused, :boolean, default: false, doc: "Force the focus state on the input"
  attr :multiline, :integer, default: nil, doc: "Allow for multiple lines of input"
  attr :error, :string, doc: "Error to display beneath the label"

  attr :type, :string, default: "text", doc: "Determine type of input"
  attr :name, :string, default: nil, doc: "Name of the input"

  attr :id, :string, doc: "ID for the input"
  attr :role, :string, default: nil, doc: "Defines a specific role attribute for the input"

  attr :step, :integer,
    default: nil,
    doc: "Limit increment value for numeric and date-time inputs"

  # attr :large_step, :number, doc: "Increment value for numeric and date-time inputs when using Page Up or Page Down"
  attr :auto_complete, :string,
    default: nil,
    doc:
      "Enable automatic completion by the browser. Set to off when you do not want the browser to fill in info"

  attr :max, :string,
    default: nil,
    doc: "Mimics the behavior of the native HTML attribute, limiting the maximum value"

  attr :max_length, :integer, default: nil, doc: "Maximum character length for an input"

  attr :max_height, :integer,
    default: nil,
    doc: "Maximum height of the input element. Only applies when multiline is true"

  attr :min, :string,
    default: nil,
    doc: "Mimics the behavior of the native HTML attribute, limiting the minimum value"

  attr :min_length, :integer, default: nil, doc: "Minimum character length for an input"
  attr :pattern, :string, default: nil, doc: "A regular expression to check the value against"

  attr :input_mode, :string,
    default: nil,
    values: ["none", "text", "decimal", "numeric", "tel", "search", "email", "url", nil],
    doc: "Choose the keyboard that should be used on mobile devices"

  attr :spell_check, :boolean,
    default: nil,
    doc: "Indicate whether value should have spelling checked"

  attr :aria_owns, :string,
    default: nil,
    doc: "Indicates the id of a component owned by the input"

  attr :aria_expanded, :boolean,
    default: nil,
    doc: "Indicates whether or not a Popover is displayed"

  attr :aria_controls, :string,
    default: nil,
    doc: "Indicates the id of a component controlled by the input"

  attr :aria_active_descendant, :string,
    default: nil,
    doc: "Indicates the id of a related components visually focused element to the input"

  attr :aria_autocomplete, :string,
    default: "off",
    doc: "Indicates what kind of user input completion suggestions are provided"

  # attr :show_character_count, :boolean, doc: "Indicates whether or not the character count should be displayed"
  attr :align, :string,
    values: ["left", "center", "right", nil],
    default: nil,
    doc: "Determines the alignment of the text in the input"

  attr :required_indicator, :boolean,
    default: false,
    doc: "Visual required indicator, adds an asterisk to label"

  # attr :monospaced, :boolean, doc: "Indicates whether or not a monospaced font should be used"
  attr :variant, :string,
    values: ["inherit", "borderless"],
    default: "inherit",
    doc: "Visual styling options for the TextField"

  attr :size, :string,
    values: ["slim", "medium"],
    default: "medium",
    doc: "Changes the size of the input, giving it more or less padding"

  attr :on_clear_button_click, :any,
    default: nil,
    doc: "Callback fired when clear button is clicked"

  # attr :on_spinner_change?(value: string, id: string): void,
  #     doc: "When provided, callback fired instead of onChange when value is changed via the number step control "
  # attr :tone, :"magic", doc: "Indicates the tone of the text field"
  attr :auto_size, :boolean,
    default: false,
    doc: "Whether the TextField will grow as the text within the input changes"

  attr :loading, :boolean, default: false, doc: "Indicates the loading state"
  attr :phx_focus, :any, default: nil, doc: "onFocus: Callback fired when input is focused"
  attr :phx_blur, :any, default: nil, doc: "onBlur: Callback fired when input is blurred"

  attr :phx_click, :any, default: nil, doc: "onClick"
  attr :phx_key, :any, default: nil, doc: "onKeyPress"
  attr :phx_keydown, :any, default: nil, doc: "onKeyDown"
  attr :phx_debounce, :any, default: nil
  attr :phx_throttle, :any, default: nil

  slot :connected_left, doc: "An element connected to the right of the input"
  slot :connected_right, doc: "An element connected to the right of the input"

  def text_field(assigns) do
    assigns =
      assigns
      |> assign_new(:id, fn %{field: field} -> "TextField" <> field.id end)
      |> assign_described_by()
      |> assign_labelled_by()
      |> assign_phx_bindings()
      |> assign(:class, class(assigns))
      |> assign(:input_class, input_class(assigns))
      |> assign(:as, if(is_integer(assigns.multiline), do: "textarea", else: "input"))
      |> assign_new(:error, &translate_errors(&1[:field]))

    ~H"""
    <.labelled
      label={@label}
      id={@id}
      error={@error}
      action={@label_action}
      label_hidden={@label_hidden}
      help_text={@help_text}
      required_indicator={@required_indicator}
      disabled={@disabled}
      read_only={@read_only}
    >
      <.connected>
        <:left>{render_slot(@connected_left)}</:left>
        <div
          class={["Polaris-TextField", @class]}
          {phx_bindings(%{phx_click: handle_textfield_click(@id)})}
        >
          <div
            :if={@prefix}
            class={["Polaris-TextField__Prefix", "Polaris-TextField__Prefix"]}
            id={prefix_id(@id)}
          >
            <.text as="span" variant="bodyMd">
              {@prefix}
            </.text>
          </div>
          <%!-- autoSize ? --%>
          <%!-- verticalContent ? inputWithVerticalContentMarkup  --%>
          <.as
            element={@as}
            name={@field.name}
            value={@field.value}
            id={input_id(@id)}
            disabled={@disabled}
            read_only={@read_only}
            role={@role}
            auto_focus={@auto_focus}
            placeholder={@placeholder}
            auto_complete={@auto_complete}
            class={["Polaris-TextField__Input", @input_class]}
            min={@min}
            max={@max}
            step={@step}
            min_length={@min_length}
            max_length={@max_length}
            spell_check={@spell_check}
            pattern={@pattern}
            input_mode={@input_mode}
            type={@type}
            rows={@multiline}
            size={if @auto_size, do: 1}
            aria-describedby={@described_by}
            aria-labelledby={@labelled_by}
            aria-invalid={!!@error}
            aria-owns={@aria_owns}
            aria-activedescendant={@aria_active_descendant}
            aria-autocomplete={@aria_autocomplete}
            aria-controls={@aria_controls}
            aria-expanded={@aria_expanded}
            aria-required={@required_indicator}
            aria-multiline={@multiline}
            data-1p-ignore={if @auto_complete == "off", do: true}
            data-lpignore={if @auto_complete == "off", do: true}
            data-form-type={if @auto_complete == "off", do: true}
            {@bindings}
          />
          <div :if={@suffix} class="Polaris-TextField__Suffix" id={suffix_id(@id)}>
            <.text as="span" variant="bodyMd">
              {@suffix}
            </.text>
          </div>
          <%!-- {characterCountMarkup} --%>
          <.clear_button
            :if={@clear_button && String.length(@field.value) > 0}
            phx_click={@on_clear_button_click}
          />
          <div :if={@loading} class="Polaris-TextField__Loading" id={loading_id(@id)}>
            <.spinner size="small" accessibility_label={"#{@label} Loading"} />
          </div>
          <div class="Polaris-TextField__Backdrop"></div>
          <%!-- {resizer} --%>
        </div>
        <:right>{render_slot(@connected_right)}</:right>
      </.connected>
    </.labelled>
    """
  end

  def handle_textfield_click(js \\ %JS{}, id) do
    js |> JS.focus(to: input_id(id))
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:disabled, true}), do: ["Polaris-TextField--disabled"]
  defp build_class({:read_only, true}), do: ["Polaris-TextField--readOnly"]
  defp build_class({:error, value}) when not is_nil(value), do: ["Polaris-TextField--error"]
  defp build_class({:multiline, true}), do: ["Polaris-TextField--multiline"]

  defp build_class({:multiline, value}) when is_integer(value),
    do: ["Polaris-TextField--multiline"]

  defp build_class({:focused, true}), do: ["Polaris-TextField--focus"]

  defp build_class({:tone, value}) when is_binary(value),
    do: "Polaris-TextField--tone#{Macro.camelize(value)}"

  defp build_class({:size, "slim"}), do: ["Polaris-TextField--slim"]
  defp build_class({:variant, "borderless"}), do: ["Polaris-TextField--borderless"]

  defp build_class({:suggestion, value}) when is_binary(value),
    do: ["Polaris-TextField--hasValue"]

  defp build_class({:value, value}) when is_binary(value), do: ["Polaris-TextField--hasValue"]

  defp build_class({_key, _value}), do: []

  def input_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_input_class/1) |> Enum.join(" ")

  defp build_input_class({:align, value}) when is_binary(value),
    do: ["Polaris-TextField__Input--align#{Macro.camelize(value)}"]

  defp build_input_class({:suffix, value}) when is_binary(value),
    do: ["Polaris-TextField__Input--suffixed"]

  defp build_input_class({:clear_button, true}), do: ["Polaris-TextField__Input--hasClearButton"]
  defp build_input_class({:monospaced, true}), do: ["Polaris-TextField--monospaced"]

  defp build_input_class({:suggestion, value}) when is_binary(value),
    do: ["Polaris-TextField--suggestion"]

  defp build_input_class({:auto_size, true}), do: ["Polaris-TextField--autoSize"]

  defp build_input_class({_key, _value}), do: []

  defp assign_described_by(%{id: id} = assigns) do
    described_by = assigns |> Enum.flat_map(&build_described_by(&1, id)) |> Enum.join(" ")
    assign(assigns, :described_by, described_by)
  end

  def build_described_by({:error, value}, id) when not is_nil(value), do: [error_id(id)]
  def build_described_by({:help_text, value}, id) when not is_nil(value), do: [help_text_id(id)]
  def build_described_by({_key, _value}, _id), do: []

  defp assign_labelled_by(%{id: id} = assigns) do
    labeled_by = assigns |> Enum.flat_map(&build_labelled_by(&1, id)) |> Enum.join(" ")
    assign(assigns, :labelled_by, labeled_by)
  end

  def build_labelled_by({:label, value}, id) when not is_nil(value), do: [label_id(id)]
  def build_labelled_by({:prefix, value}, id) when not is_nil(value), do: [prefix_id(id)]
  def build_labelled_by({:suffix, value}, id) when not is_nil(value), do: [suffix_id(id)]

  def build_labelled_by({:vertical_content, value}, id) when not is_nil(value),
    do: [vertical_content_id(id)]

  def build_labelled_by({_key, _value}, _id), do: []

  defp label_id(id), do: id <> "Label"
  defp input_id(id), do: id <> "Input"
  defp error_id(id), do: id <> "Error"
  defp help_text_id(id), do: id <> "HelpText"
  defp prefix_id(id), do: id <> "Prefix"
  defp suffix_id(id), do: id <> "Suffix"
  defp vertical_content_id(id), do: id <> "VerticalContent"
  defp loading_id(id), do: id <> "Loading"

  attr :disabled, :boolean, default: false
  attr :phx_click, :any, default: nil

  defp clear_button(assigns) do
    assigns = assigns |> assign_phx_bindings([:phx_click])

    ~H"""
    <button type="button" class="Polaris-TextField__ClearButton" disabled={@disabled} {@bindings}>
      <.text as="span" visually_hidden>
        clear
      </.text>
      <.icon tone="base"><Icons.x_circle /></.icon>
    </button>
    """
  end

  @doc """
  As
  A helper for setting the underlaying element of a component
  """
  attr :element, :string,
    values: ["input", "textarea"],
    required: true

  attr :value, :string

  attr :rest, :global,
    include:
      ~w(pattern spell_check name max disabled min step max_length read_only size auto_focus rows min_length auto_complete input_mode)

  def as(%{element: "input"} = assigns),
    do: ~H"<input value={@value} {@rest} />"

  def as(%{element: "textarea"} = assigns),
    do: ~H"<textarea {@rest}><%= @value %></textarea>"

  @doc """
  Join items, specificaly text fields.
  """

  slot :left
  slot :inner_block, required: true
  slot :right

  def connected(assigns) do
    ~H"""
    <div class="Polaris-Connected">
      <.connected_item :for={left <- @left} position="left">{render_slot(left)}</.connected_item>
      <.connected_item position="primary">{render_slot(@inner_block)}</.connected_item>
      <.connected_item :for={right <- @right} position="right">
        {render_slot(right)}
      </.connected_item>
    </div>
    """
  end

  attr :position, :string, values: ["left", "primary", "right"], required: true

  slot :inner_block, required: true

  defp connected_item(assigns) do
    assigns = assigns |> assign(:class, connected_item_class(assigns))

    ~H"""
    <div class={["Polaris-Connected__Item", @class]}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  def connected_item_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_connected_item_class/1) |> Enum.join(" ")

  defp build_connected_item_class({:position, "primary"}),
    do: ["Polaris-Connected__Item--primary"]

  defp build_connected_item_class({_key, _value}), do: []
end
