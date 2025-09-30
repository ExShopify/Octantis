defmodule OctantisWeb.Components.Polaris.ComplexAction do
  @moduledoc """
  Complex actions are an implied component in Polaris... Usually it is a button.

  ## See
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/types.ts#L228
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Button/utils.tsx#L28
  """
  use OctantisWeb.Core

  import OctantisWeb.Components.Polaris.Button, only: [button: 1]

  alias OctantisWeb.Components.Polaris.Icons

  @link_attributes [:navigate, :patch, :href, :replace, :method, :csrf_token, :target]
  @button_attributes [
    :id,
    :content,
    :disabled,
    :accessibility_label,
    :url,
    :external,
    :full_width,
    :variant,
    :size,
    :tone,
    :phx_click,
    :phx_values
  ]

  attr :id, :string, doc: "A unique identifier for the action"
  attr :content, :string, default: nil, doc: "Content the action displays"
  attr :accessibility_label, :string, doc: "Visually hidden text for screen readers"
  attr :url, :string, doc: "A destination to link to, rendered in the action"
  attr :external, :boolean, doc: "Forces url to open in a new tab"
  # attr :target, :Target, doc: "Where to display the url"
  # attr :on_action?(): void, doc: "Callback when an action takes place"
  # attr :on_mouse_enter?(): void, doc: "Callback when mouse enter"
  # attr :on_touch_start?(): void, doc: "Callback when element is touched"
  attr :disabled, :boolean, doc: "Whether or not the action is disabled", default: false
  # attr :destructive, :boolean, doc: "Destructive action"

  # attr :outline?: boolean, doc: "Should action be displayed as an outlined button"
  # attr :loading?: boolean, doc: "Should a spinner be displayed"
  # attr :plain?: boolean, doc: "Should action be displayed as a plain link"

  attr :full_width, :boolean,
    doc: "Allows the button to grow to the width of its container",
    default: false

  attr :variant, :string,
    values: ["plain", "primary", "secondary", "tertiary", "monochromePlain"],
    doc: "Changes the visual appearance of the Button."

  attr :tone, :string,
    values: ["critical", "success"],
    doc: "Sets the color treatment of the Button."

  attr :size, :string,
    values: ["micro", "slim", "medium", "large"],
    default: "medium",
    doc: "Changes the size of the button, giving it more or less padding"

  attr :icon, :any, default: nil, doc: "Source of the icon", examples: [&Icons.arrow_right/1]

  attr :phx_click, :any, doc: "Click function passed through to the button"

  attr :phx_values, :list,
    default: [],
    doc:
      "A list of key value pairs to be passed as a value for actions. See assign_phx_bindings/2",
    examples: [[key: "value"]]

  attr :navigate, :string, doc: "Passes through to .link component"
  attr :patch, :string, doc: "Passes through to .link component"
  attr :href, :string, doc: "Passes through to .link component"
  attr :replace, :string, doc: "Passes through to .link component"
  attr :method, :string, doc: "Passes through to .link component"
  attr :csrf_token, :string, doc: "Passes through to .link component"
  attr :target, :string, doc: "Passes through to .link component"

  attr_extra_styles()

  attr :rest, :global

  @doc @moduledoc

  def complex_action(assigns) do
    assigns =
      assigns
      |> assign(:link_attrs, Map.take(assigns, @link_attributes))
      |> assign(:button_attrs, Map.take(assigns, @button_attributes))
      |> assign_extra_styles()

    ~H"""
    <.link :if={map_size(@link_attrs) > 0} {@link_attrs}>
      <.button {@button_attrs} {@extra_styles} {@rest}>
        <:icon :if={@icon}>{@icon.(%{})}</:icon>
      </.button>
    </.link>
    <.button :if={map_size(@link_attrs) <= 0} {@button_attrs} {@extra_styles} {@rest}>
      <:icon :if={@icon}>{@icon.(%{})}</:icon>
    </.button>
    """
  end

  defmacro attributes do
    quote do
      attr :content, :string, doc: "Content the action displays"

      attr :disabled, :boolean, doc: "Whether or not the action is disabled"

      attr :variant, :string,
        values: ["plain", "primary", "secondary", "tertiary", "monochromePlain"],
        doc: "Changes the visual appearance of the Button."

      attr :tone, :string,
        values: ["critical", "success"],
        doc: "Sets the color treatment of the Button."

      attr :full_width, :boolean, doc: "Allows the button to grow to the width of its container"

      attr :size, :string,
        values: ["micro", "slim", "medium", "large"],
        doc: "Changes the size of the button, giving it more or less padding"

      attr :navigate, :string, doc: "Passes through to .link component"
      attr :patch, :string, doc: "Passes through to .link component"
      attr :href, :string, doc: "Passes through to .link component"
      attr :target, :string, doc: "Passes through to .link component"

      attr :icon, :any, doc: "Source of the icon", examples: [&Icons.arrow_right/1]

      attr :phx_click, :any, doc: "Click function passed through to the button"
    end
  end
end
