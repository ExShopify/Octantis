defmodule OctantisWeb.Components.Polaris.Banner do
  @moduledoc """
  Use to convey general information or actions that aren’t critical. For example, you might show a banner that asks for merchant feedback. Default banners contain lower priority information and should always be dismissible.

  ## Examples
    ```elixir
    <.banner title="Order archived" >
          <p>This order was archived on March 7, 2017 at 3:12pm EDT.</p>
    </.banner>
    ```

  See
   - https://polaris.shopify.com/components/feedback-indicators/banner
   - https://github.com/Shopify/polaris/blob/main/polaris-react/src/components/Banner/Banner.tsx
  """

  use OctantisWeb.Core

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([
    :block_stack,
    :box,
    :button,
    :button_group,
    :icon,
    :inline_stack,
    :text
  ])

  alias OctantisWeb.Components.Polaris.ComplexAction
  alias OctantisWeb.Components.Polaris.Icons

  @doc @moduledoc

  attr :id, :string, required: true, doc: "id of the banner"

  attr :title, :string, default: nil, doc: "Title content for the banner."

  attr :icon, :any,
    doc: "Status icon to display in the banner. Use only major icons",
    examples: [&Icons.arrow_right/1]

  attr :hide_icon, :boolean, default: false, doc: "Renders the banner without a status icon."

  attr :tone, :string,
    default: "info",
    values: ["success", "info", "warning", "critical"],
    doc: "Sets the status of the banner."

  attr :on_dismiss, :any,
    default: nil,
    doc: "Callback when banner is dismissed",
    examples: ["Banner.hide(@id)"]

  attr :stop_announcements, :boolean,
    default: false,
    doc: "Disables screen reader announcements when changing the content of the banner"

  attr :within_container, :boolean,
    default: false,
    doc: "Change the render style to be within a content container, whatever that might mean."

  attr_extra_styles()

  attr :rest, :global, doc: "the arbitrary HTML attributes to add to the banner container"

  slot :action,
    validate_attrs: true,
    doc: "Primary action for the banner" do
    ComplexAction.attributes()
  end

  slot :secondary_action,
    validate_attrs: true,
    doc: "Action | Displays a secondary action" do
    ComplexAction.attributes()
  end

  slot :inner_block

  def banner(assigns) do
    assigns =
      assigns
      |> assign_banner_type()
      |> assign_role()
      |> assign_has_content()
      |> assign_icon()
      |> assign_color()
      |> assign_background()
      |> assign(:class, class(assigns))
      |> assign(:icon_class, icon_class(assigns))
      |> assign(:style, extra_styles(assigns))

    ~H"""
    <div
      id={banner_id(@id)}
      class={["Polaris-Banner", @class]}
      tabIndex={0}
      role={@role}
      aria-live={if @stop_announcements, do: "off", else: "polite"}
      style={@style}
      data-show={show(@id)}
      data-hide={hide(@id)}
      {@rest}
    >
      <.box :if={@banner_type == :default} width="100%">
        <.block_stack align="space-between">
          <.box
            background={@background}
            color={@color}
            border_start_start_radius="300"
            border_start_end_radius="300"
            border_end_start_radius={if !@has_content, do: "300"}
            border_end_end_radius={if !@has_content, do: "300"}
            padding={[xs: "300"]}
          >
            <.inline_stack align="space-between" block_align="center" gap={[xs: "200"]} wrap={false}>
              <.inline_stack gap={[xs: "100"]} wrap={false}>
                <span class={@icon_class}>
                  <.icon>{@icon.(%{})}</.icon>
                </span>
                <.text :if={@title} as="h2" variant="headingSm" break_word={true}>
                  {@title}
                </.text>
              </.inline_stack>
              <.button :if={@on_dismiss} variant="tertiary" phx_click={@on_dismiss}>
                <:icon><span class="Polaris-Banner--textInfoOnBgFill"><Icons.x_small /></span></:icon>
              </.button>
            </.inline_stack>
          </.box>

          <.box :if={@has_content} padding={[xs: "300", md: "400"]} padding_block_start={[xs: "300"]}>
            <.block_stack gap={[xs: "200"]}>
              <div>{render_slot(@inner_block)}</div>
              <.button_group>
                <:complex_action :for={action <- @secondary_action} {action} />
                <:complex_action :for={action <- @action} {action} />
              </.button_group>
            </.block_stack>
          </.box>
        </.block_stack>
      </.box>

      <.box :if={@banner_type == :inline_icon} width="100%" padding={[xs: "300"]} border_radius="300">
        <.inline_stack align="space-between" block_align="center" wrap={false}>
          <.box width="100%">
            <.inline_stack gap={[xs: "200"]} wrap={false} block_align="center">
              <div>
                <.box background={@background} border_radius="200" padding={[xs: "100"]}>
                  <span class={@icon_class}>
                    <.icon>{@icon.(%{})}</.icon>
                  </span>
                </.box>
              </div>

              <.box width="100%">
                <.block_stack gap={[xs: "200"]}>
                  <div>{render_slot(@inner_block)}</div>
                  <.button_group>
                    <:complex_action :for={action <- @secondary_action} {action} />
                    <:complex_action :for={action <- @action} {action} />
                  </.button_group>
                </.block_stack>
              </.box>
            </.inline_stack>
          </.box>

          <div class="Polaris-Banner__DismissIcon">
            <.button :if={@on_dismiss} variant="tertiary" phx_click={@on_dismiss}>
              <:icon><span class="Polaris-Banner__icon--secondary"><Icons.x_small /></span></:icon>
            </.button>
          </div>
        </.inline_stack>
      </.box>

      <.box
        :if={@banner_type == :within_container}
        width="100%"
        background={@background}
        padding={[xs: "200"]}
        border_radius="200"
        color={@color}
      >
        <.inline_stack align="space-between" block_align="start" wrap={false} gap={[xs: "200"]}>
          <.inline_stack gap={[xs: "150"]} wrap={false}>
            <span class={@icon_class}>
              <.icon>{@icon.(%{})}</.icon>
            </span>
            <.box width="100%">
              <.block_stack gap={[xs: "200"]}>
                <.block_stack gap={[xs: "050"]}>
                  <.text :if={@title} as="h2" variant="headingSm" break_word={true}>
                    {@title}
                  </.text>
                  <div>{render_slot(@inner_block)}</div>
                </.block_stack>
                <.button_group>
                  <:complex_action :for={action <- @secondary_action} {action} />
                  <:complex_action :for={action <- @action} {action} />
                </.button_group>
              </.block_stack>
            </.box>
          </.inline_stack>
          <.button :if={@on_dismiss} variant="tertiary" phx_click={@on_dismiss}>
            <:icon><span class="Polaris-Banner__icon--secondary"><Icons.x_small /></span></:icon>
          </.button>
        </.inline_stack>
      </.box>
    </div>
    """
  end

  def class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_class/1) |> Enum.join(" ")

  defp build_class({:within_container, true}), do: [@class_prefix <> "--withinContentContainer"]
  defp build_class({:within_container, false}), do: [@class_prefix <> "--withinPage"]
  defp build_class({_key, _value}), do: []

  def icon_class(attrs) when is_map(attrs),
    do: attrs |> Enum.flat_map(&build_icon_class/1) |> Enum.join(" ")

  defp build_icon_class({:tone, value}),
    do: [@class_prefix <> "--text#{Macro.camelize(value)}OnBgFill"]

  defp build_icon_class({_key, _value}), do: []

  def assign_role(assigns) do
    if assigns.tone === "warning" or assigns.tone === "critical" do
      assign(assigns, :role, "alert")
    else
      assign(assigns, :role, "status")
    end
  end

  def assign_has_content(assigns) do
    if assigns.inner_block == [] and assigns.action == [] and assigns.secondary_action == [] do
      assign(assigns, :has_content, false)
    else
      assign(assigns, :has_content, true)
    end
  end

  def assign_icon(assigns) do
    icon =
      case assigns.tone do
        "success" -> &Icons.check/1
        "info" -> &Icons.info/1
        "warning" -> &Icons.alert_triangle/1
        "critical" -> &Icons.alert_diamond/1
      end

    assign_new(assigns, :icon, fn -> icon end)
  end

  def assign_color(%{tone: value, within_container: true} = assigns),
    do: assign_new(assigns, :color, fn -> "text-#{value}" end)

  def assign_color(%{tone: value, within_container: false} = assigns),
    do: assign_new(assigns, :color, fn -> "text-#{value}-on-bg-fill" end)

  def assign_background(%{tone: value, within_container: true} = assigns),
    do: assign_new(assigns, :background, fn -> "bg-surface-#{value}" end)

  def assign_background(%{tone: value, within_container: false} = assigns),
    do: assign_new(assigns, :background, fn -> "bg-fill-#{value}" end)

  def assign_banner_type(%{within_container: true} = assigns),
    do: assign(assigns, :banner_type, :within_container)

  def assign_banner_type(%{title: nil} = assigns), do: assign(assigns, :banner_type, :inline_icon)
  def assign_banner_type(assigns), do: assign(assigns, :banner_type, :default)

  slot :action,
    validate_attrs: true,
    doc: "Primary action for the banner" do
    ComplexAction.attributes()
  end

  slot :secondary_action,
    validate_attrs: true,
    doc: "Action | Displays a secondary action" do
    ComplexAction.attributes()
  end

  slot :inner_block

  defp content_block(assigns) do
    ~H"""
    <.block_stack gap={[xs: "200"]}>
      <div>{render_slot(@inner_block)}</div>
      <.button_group>
        <:complex_action :for={action <- @secondary_action} {action} />
        <:complex_action :for={action <- @action} {action} />
      </.button_group>
    </.block_stack>
    """
  end

  def banner_id(id), do: "Banner" <> id

  def show(js \\ %JS{}, id), do: JS.show(js, to: "#" <> banner_id(id))
  def hide(js \\ %JS{}, id), do: JS.hide(js, to: "#" <> banner_id(id))

  def push_open(socket, id),
    do: Phoenix.LiveView.push_event(socket, "octantis:modal_show_" <> banner_id(id), %{})

  def push_close(socket, id),
    do: Phoenix.LiveView.push_event(socket, "octantis:modal_hide_" <> banner_id(id), %{})
end
