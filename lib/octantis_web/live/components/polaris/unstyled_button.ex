defmodule OctantisWeb.Components.Polaris.UnstyledButton do
  @moduledoc """
  Underlying button. Button is implemented with this and
    sometimes Polaris uses this directly instead of button

  ## Examples
    ```elixir
    <.unstyled_button>Button</.unstyled_button>
    ```

  See
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/UnstyledButton/UnstyledButton.tsx
  """

  use OctantisWeb.Core

  @doc @moduledoc

  attr :id, :string, default: nil

  attr :class, :any, default: nil

  attr :submit, :boolean, default: false

  attr :disabled, :boolean, default: false

  attr :loading, :boolean, default: false

  attr :aria_controls, :string,
    default: nil,
    doc: "Indicates the ID of the element that is controlled by the button"

  attr :aria_described_by, :string,
    default: nil,
    doc: "Indicates the ID of the element that describes the button"

  attr :aria_expanded, :string, default: nil
  attr :aria_checked, :string, default: nil
  attr :aria_pressed, :string, default: nil
  attr :aria_label, :string, default: nil

  attr :role, :string, default: nil

  attr :url, :string, default: nil

  attr :phx_click, :any, default: nil, doc: "onClick"
  attr :phx_focus, :any, default: nil, doc: "onFocus"
  attr :phx_blur, :any, default: nil, doc: "onBlur"
  attr :phx_key, :any, default: nil, doc: "onKeyPress"
  attr :phx_keyup, :any, default: nil, doc: "onKeyUp"
  attr :phx_keydown, :any, default: nil, doc: "onKeyDown"

  attr :phx_target, :any, default: nil, doc: "Allows setting the target for the button"

  # attr :on_mouse_up, :any, default: nil, doc: "onMouseUp"
  # attr :on_mouse_enter, :any, default: nil, doc: "onMouseEnter"
  # attr :on_touch_start, :any, default: nil, doc: "onTouchStart"

  attr :name, :string, default: nil, doc: "Name to be passed down to the button"
  attr :value, :string, default: nil, doc: "Name to be passed down to the button"

  attr :phx_values, :list,
    default: [],
    doc:
      "A list of key value pairs to be passed as a value for actions. See assign_phx_bindings/2",
    examples: [[key: "value"]]

  attr_extra_styles()

  attr :rest, :global

  slot :inner_block

  def unstyled_button(assigns) do
    assigns =
      assigns
      |> assign_phx_bindings()
      |> assign_extra_styles()
      |> assign_new(:style, &extra_styles/1)

    ~H"""
    <button
      :if={!@url}
      id={@id}
      class={@class}
      style={@style}
      role={@role}
      name={@name}
      value={@value}
      aria-disabled={@disabled}
      type={if @submit, do: "submit", else: "button"}
      aria-label={@aria_label}
      aria-busy={if @loading, do: true}
      aria-controls={@aria_controls}
      aria-expanded={@aria_expanded}
      aria-describedby={@aria_described_by}
      aria-checked={@aria_checked}
      aria-pressed={@aria_pressed}
      tabIndex={if @disabled, do: -1}
      {@rest}
      {@bindings}
    >
      {render_slot(@inner_block)}
    </button>
    <span :if={@url}>Unimplemented UnstyledLink</span>
    """
  end
end
