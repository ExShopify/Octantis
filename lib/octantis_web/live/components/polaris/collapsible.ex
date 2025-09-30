defmodule OctantisWeb.Components.Polaris.Collapsible do
  @moduledoc """
  The collapsible component is used to put long sections of information under a block that merchants can expand or collapse.

  ## Examples
  ```elixir
  <.collapsible id="collapsible-default-default" open>
    <.text as="h2" variant="bodyMd">Content inside a collapse</.text>
  </.collapsible>
  ```

  ```elixir
  {:noreply, Collapsible.push_close(socket, "MyId")}
  ```

  ## See
   - https://polaris.shopify.com/components/utilities/collapsible
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Collapsible/Collapsible.tsx
  """

  use OctantisWeb.Core

  @doc @moduledoc

  ### Transition
  # attr :animate_in, :boolean, doc: "Expand the collpsible on render."
  # attr :delay, :MotionDurationScale, doc: "Assign a transition delay to the collapsible animation"
  # attr :duration, :string, doc: "Assign a transition duration to the collapsible animation."
  # attr :timing_function, :string, doc: "Assign a transition timing function to the collapsible animation"

  attr :id, :string,
    required: true,
    doc:
      "Assign a unique ID to the collapsible. For accessibility, pass this ID as the value of the triggering component’s aria-controls prop."

  attr :expand_on_print, :boolean,
    default: false,
    doc: "Option to show collapsible content when printing"

  attr :open, :boolean, default: false, doc: "Toggle whether the collapsible is expanded or not."

  attr :variant, :string,
    values: ["block", "inline"],
    default: "block",
    doc: "The direction the collapsible collapses in."

  # attr :transition, :any,
  # @default transition={{duration: "var(--p-motion-duration-150)", timingFunction: "var(--p-motion-ease-in-out)"}},
  # doc: Override transition properties. When set to false, disables transition completely.
  # attr :onAnimationEnd?(): void, doc: "Callback when the animation completes."
  # children?: ReactNode;

  attr :phx_hook, :string, default: "OctantisInteractable"

  slot :inner_block

  def collapsible(assigns) do
    assigns =
      assigns
      |> assign(:class, class(assigns))
      |> assign_phx_bindings()

    ~H"""
    <div
      id={collapsible_id(@id)}
      style="max-height:none;overflow:visible;"
      class={["Polaris-Collapsible", @class]}
      {@bindings}
      aria-hidden={!@open}
      data-oct-open={open(@id)}
      data-oct-close={close(@id)}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  defp class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:expand_on_print, true}), do: ["Polaris-Collapsible--expandOnPrint"]
  defp build_class({:variant, "inline"}), do: ["Polaris-Collapsible--inline"]
  defp build_class({:open, false}), do: ["Polaris-Collapsible--isFullyClosed"]
  defp build_class({_key, _value}), do: []

  def collapsible_id(id), do: "Collapsible" <> id

  def open(js \\ %JS{}, id),
    do: JS.remove_class(js, "Polaris-Collapsible--isFullyClosed", to: "#" <> collapsible_id(id))

  def close(js \\ %JS{}, id),
    do: JS.add_class(js, "Polaris-Collapsible--isFullyClosed", to: "#" <> collapsible_id(id))

  def toggle(js \\ %JS{}, id),
    do: JS.toggle_class(js, "Polaris-Collapsible--isFullyClosed", to: "#" <> collapsible_id(id))

  def push_open(socket, id) do
    Phoenix.LiveView.push_event(socket, "octantis:interactable_" <> collapsible_id(id), %{
      key: "data-oct-open"
    })
  end

  def push_close(socket, id) do
    Phoenix.LiveView.push_event(socket, "octantis:interactable_" <> collapsible_id(id), %{
      key: "data-oct-close"
    })
  end
end
