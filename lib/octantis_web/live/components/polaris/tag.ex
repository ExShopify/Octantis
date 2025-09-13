defmodule OctantisWeb.Components.Polaris.Tag do
  @moduledoc """
  Tags represent a set of interactive, merchant-supplied keywords that help label, organize, and categorize objects. Tags can be added or removed from an object by merchants.

  ## Examples
  ```elixir
  <.tag>Wholesale</.tag>
  ```

  ## See
   - https://polaris.shopify.com/components/selection-and-input/tag
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Tag/Tag.tsx
  """

  use OctantisWeb.Core, :component

  import OctantisWeb.Components.Polaris.Text, only: [text: 1]

  import_polaris_components([:button, :icon, :text])

  alias OctantisWeb.Components.Polaris.Icons

  @doc @moduledoc

  # attr :onClick?(): void, doc: "Callback when tag is clicked or keypressed.
  #  Renders without remove button or url when set."
  attr :on_remove, :any,
    default: nil,
    doc: "Callback when remove button is clicked or keypressed."

  attr :phx_values, :list,
    default: [],
    doc:
      "A list of key value pairs to be passed as a value for actions. See assign_phx_bindings/2",
    examples: [[key: "value"]]

  # attr :url?: string, doc: "Url to navigate to when tag is clicked or keypressed."

  attr :disabled, :boolean, doc: "Disables the tag", default: false

  attr :accessibility_label, :string,
    default: nil,
    doc: "A string to use when tag has more than textual content"

  attr :class, :string, default: "", doc: "A class name to be added to the component class name"

  attr :size, :string, values: ["large", nil], default: nil, doc: "The size of the tag"

  attr :name, :string, default: nil, doc: "Name to be passed down to the remove button"

  attr :value, :string, default: nil, doc: "Name to be passed down to the remove button"

  slot :inner_block, required: true

  def tag(assigns) do
    assigns =
      assigns
      |> assign(:class, [assigns.class, class(assigns)])

    ~H"""
    <span class={["Polaris-Tag", @class]} aria-disabled={@disabled}>
      <.text as="span" variant="bodySm" truncate={true}>
        <span title={@accessibility_label} class="Polaris-Tag__Text">
          {render_slot(@inner_block)}
        </span>
      </.text>
      <span :if={@size == "large"} class="Polaris-Tag--overlay" />
      <.button
        :if={@on_remove}
        type="button"
        class="Polaris-Tag__Button"
        name={@name}
        value={@value}
        phx_click={@on_remove}
        phx_values={@phx_values}
        disabled={@disabled}
      >
        <.icon><Icons.x_small /></.icon>
      </.button>
    </span>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:disabled, true}), do: ["Polaris-Tag--disabled"]
  defp build_class({:on_remove, value}) when is_binary(value), do: ["Polaris-Tag--removable"]
  defp build_class({_key, _value}), do: []
end
