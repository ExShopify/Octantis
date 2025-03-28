defmodule OctantisWeb.Components.Polaris.Button do
  @moduledoc """
  Cards are used to group similar concepts and tasks together for merchants to scan, read, and get things done. It displays content in a familiar and recognizable style.
  ## Examples
    ```elixir
    <.button>
      Add product
    </.button>
    ```

  See
   - https://polaris.shopify.com/components/actions/button
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Button/Button.tsx
  """
  use OctantisWeb.Core

  import_polaris_components([:icon, :text, :unstyled_button])

  @doc @moduledoc

  attr :class, :any, doc: "The class to be passed down to the button"

  attr :content, :string, default: nil, doc: "Content of the button"

  attr :disabled, :boolean, doc: "Whether or not the action is disabled", default: false

  attr :size, :string,
    values: ["micro", "slim", "medium", "large"],
    default: "medium",
    doc: "Changes the size of the button, giving it more or less padding"

  attr :text_align, :string,
    values: ["left", "right", "center", "start", "end"],
    doc: "Changes the inner text alignment of the button",
    default: "center"

  attr :full_width, :boolean,
    doc: "Allows the button to grow to the width of its container",
    default: false

  attr :disclosure, :string,
    values: ["down", "up", "select"],
    doc: "Displays the button with a disclosure icon. Defaults to `down` when set to true"

  attr :data_primary_link, :boolean,
    doc:
      "Indicates whether or not the button is the primary navigation link when rendered inside of an `IndexTable.Row`"

  attr :tone, :string,
    values: ["critical", "success"],
    doc: "Sets the color treatment of the Button."

  attr :variant, :string,
    values: ["plain", "primary", "secondary", "tertiary", "monochromePlain"],
    doc: "Changes the visual appearance of the Button.",
    default: "secondary"

  attr :submit, :boolean, doc: "Allows the button to submit a form", default: false

  attr :name, :string, default: nil, doc: "Name to be passed down to the button"

  attr :value, :string, default: nil, doc: "Name to be passed down to the button"

  attr :phx_click, :any, default: nil

  attr :phx_target, :any, default: nil, doc: "Allows setting the target for the button"

  attr :phx_values, :list,
    default: [],
    doc:
      "A list of key value pairs to be passed as a value for actions. See assign_phx_bindings/2",
    examples: [[key: "value"]]

  attr_extra_styles()

  attr :rest, :global

  slot :icon, doc: "Icon to display to the left of the button content"

  slot :inner_block

  def button(assigns) do
    text_variant = if assigns[:size] == "large", do: "bodyMd", else: "bodySm"
    text_font_weight = if assigns[:variant] == "primary", do: "semibold", else: "medium"

    assigns =
      assigns
      |> assign_icon_status()
      |> assign_class()
      |> assign(:text_variant, text_variant)
      |> assign(:text_font_weight, text_font_weight)
      |> assign_extra_styles()

    ~H"""
    <.unstyled_button
      class={["Polaris-Button Polaris-Button--pressable", @class]}
      submit={@submit}
      name={@name}
      value={@value}
      phx_click={@phx_click}
      phx_target={@phx_target}
      phx_values={@phx_values}
      {@extra_styles}
      {@rest}
    >
      <span :for={icon <- @icon} class="Polaris-Button__Icon">
        <.icon>{render_slot(icon)}</.icon>
      </span>
      <.text :if={@inner_block} as="span" variant={@text_variant} font_weight={@text_font_weight}>
        {render_slot(@inner_block)}
      </.text>
      <.text :if={@content} as="span" variant={@text_variant} font_weight={@text_font_weight}>
        {@content}
      </.text>
    </.unstyled_button>
    """
  end

  defp assign_class(assigns),
    do: assigns |> assign_new(:class, fn assigns -> button_build_class(assigns) end)

  defp button_build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&button_class/1) |> Enum.join(" ")

  defp button_class({:variant, variant}),
    do: ["Polaris-Button--variant#{Macro.camelize(variant)}"]

  defp button_class({:size, size}), do: ["Polaris-Button--size#{Macro.camelize(size)}"]
  defp button_class({:tone, tone}), do: ["Polaris-Button--tone#{Macro.camelize(tone)}"]

  defp button_class({:text_align, align}),
    do: ["Polaris-Button--textAlign#{Macro.camelize(align)}"]

  defp button_class({:full_width, true}), do: ["Polaris-Button--fullWidth"]
  defp button_class({:pressed, true}), do: ["Polaris-Button--pressed"]
  defp button_class({:disabled, true}), do: ["Polaris-Button--disabled"]
  defp button_class({:icon_status, :icon_only}), do: ["Polaris-Button--iconOnly"]
  defp button_class({:icon_status, :icon_with_text}), do: ["Polaris-Button--iconWithText"]

  defp button_class({_key, _value}), do: []

  defp assign_icon_status(assigns = %{icon: icon, content: content})
       when not is_nil(icon) and not is_nil(content),
       do: assign(assigns, :icon_status, :icon_with_text)

  defp assign_icon_status(assigns = %{icon: icon}) when not is_nil(icon),
    do: assign(assigns, :icon_status, :icon_only)

  defp assign_icon_status(assigns), do: assign(assigns, :icon_status, :text_only)
end
