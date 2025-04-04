defmodule OctantisWeb.Components.Polaris.Collapsible do
  @moduledoc """
  The collapsible component is used to put long sections of information under a block that merchants can expand or collapse.

  ## Examples
    ```elixir
    <.collapsible id="collapsible-default-default" open>
      <.text as="h2" variant="bodyMd">Content inside a collapse</.text>
    </.collapsible>
    ```

  See
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

  slot :inner_block

  def collapsible(assigns) do
    assigns =
      assigns
      |> assign(:class, class(assigns))
      |> assign(:style, style(assigns))

    ~H"""
    <div id={@id} style={@style} class={["Polaris-Collapsible", @class]} aria-hidden={!@open}>
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

  defp style(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_style/1) |> Enum.join(" ")

  defp build_style({:open, false}),
    do: ["max-height: 0px;", "overflow: hidden;", "aria-hidden=\"true\";"]

  defp build_style({:open, true}),
    do: ["max-height: none;", "overflow: visible;", "aria-hidden=\"false\";"]

  defp build_style({_key, _value}), do: []
end
