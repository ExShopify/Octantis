defmodule OctantisWeb.Components.Polaris.ButtonGroup do
  @moduledoc """
  Cards are used to group similar concepts and tasks together for merchants to scan, read, and get things done. It displays content in a familiar and recognizable style.

  ## Examples
  ```elixir
  <.button_group>
    <:item><.button>Cancel</.button></:item>
    <:item><.button variant="primary">Save</.button></:item>
  </.button_group>
  ```

  ```elixir
  <.button_group>
    <:complex_action content="Cancel" />
    <:complex_action content="Save" variant="primary" />
  </.button_group>
  ```

  ## See
   - https://polaris.shopify.com/components/actions/button-group
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/ButtonGroup/ButtonGroup.tsx
  """
  use Phoenix.Component

  require OctantisWeb.Components.Polaris.ComplexAction

  import OctantisWeb.Components.Polaris.Button, only: [button: 1]
  import OctantisWeb.Components.Polaris.ComplexAction, only: [complex_action: 1]

  alias OctantisWeb.Components.Polaris.ComplexAction

  @doc @moduledoc

  attr :gap, :string,
    values: ["extraTight", "tight", "loose"],
    doc: "Determines the space between button group items"

  attr :variant, :string, values: ["segmented"], doc: "Styling variant for group"

  attr :full_width, :boolean, doc: "Buttons will stretch/shrink to occupy the full width"

  # attr :connected_top, :boolean, doc: "Remove top left and right border radius"

  # attr :no_wrap, :boolean, doc: "Prevent buttons in button group from wrapping to next line"

  slot :button

  slot :inner_block

  slot :complex_action,
    validate_attrs: true,
    doc: "Complex action, rendered as a basic button" do
    ComplexAction.attributes()
  end

  def button_group(assigns) do
    assigns =
      assigns
      |> assign(:class, button_group_build_class(assigns))
      |> assign_new(:variant, fn -> nil end)
      |> assign_new(:connected_top, fn -> nil end)
      |> assign_new(:full_width, fn -> nil end)
      |> assign_new(:no_wrap, fn -> nil end)

    ~H"""
    <div
      class={["Polaris-ButtonGroup", @class]}
      data-buttongroup-variant={@variant}
      data-buttongroup-connected-top={@connected_top}
      data-buttongroup-full-width={@full_width}
      data-buttongroup-no-wrap={@no_wrap}
    >
      <div :for={action <- @complex_action} class="Polaris-ButtonGroup__Item">
        <.complex_action {action} />
      </div>
      <div :for={button <- @button} class="Polaris-ButtonGroup__Item">
        <.button {button}>{render_slot(button)}</.button>
      </div>
      {render_slot(@inner_block)}
    </div>
    """
  end

  def button_group_build_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&button_group_class/1) |> Enum.join(" ")

  def button_group_class({:variant, "segmented"}), do: ["Polaris-ButtonGroup--variantSegmented"]
  def button_group_class({:gap, value}), do: ["Polaris-ButtonGroup--gap#{Macro.camelize(value)}"]
  def button_group_class({:full_width, true}), do: ["Polaris-ButtonGroup--fullWidth"]
  def button_group_class({_key, _value}), do: []
end
