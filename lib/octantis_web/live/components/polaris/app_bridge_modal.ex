defmodule OctantisWeb.Components.Polaris.AppBridgeModal do
  @moduledoc """
  The AppBridge Modal API allows you to display an overlay that prevents interaction with the rest of the app until dismissed.

  It is used by customizing your Modal content with the ui-modal element and then opening it with the show() instance method or the shopify.modal.show("modal-id") API.

  Consider using OctantisWeb.Components.Polaris.Modal instead.

  ## Prerequisite

  The following is required in your .js file:

  ```javascript
  import { ShopifyAppBridgeModal } from "octantis";
  Hooks = { ShopifyAppBridgeModal }
  ```

  ## Push Events

  You can open and close the modal on the client from the server with

  ```elixir
  {:noreply, socket |> AppBridgeModal.push_open("my_modal_id")}
  ```

  ## Warning

  The contents of the modal are rendered in an iFrame that is not connnected to LiveView.
  This has a few very negative side effects:
  * The content of the Modal is not updated once it is initially rendered.
  * Phoenix events are not sent to the LiveView, instead they must be proxied through hidden buttons.
  * Shopify is munging events such as click events in an unknown way to reach the parent LiveView. This is fragile to say the least.

  ## Examples
    ```elixir
    <.app_bridge_modal title="Uninstall Section" id="my-modal">
      <:static_iframe>
        Are you sure you want to uninstall the section?
      </:static_iframe>
      <:primary_action content="Uninstall" phx_click="uninstall_section" phx_values={[id: "1234"]} />
      <:secondary_action content="Cancel" phx_click={AppBridgeModal.hide("my-modal")} />
    </.app_bridge_modal>

    <.button phx_click={AppBridgeModal.show("my-modal")}>Uninstall</.button>
    ```

  See
   - https://shopify.dev/docs/api/app-bridge-library/web-components/ui-modal
  """

  use OctantisWeb.Core

  require OctantisWeb.Components.Polaris.ComplexAction

  import_polaris_components([:block_stack, :box, :button, :inline_stack])

  alias OctantisWeb.Components.Polaris.ComplexAction

  @doc @moduledoc

  attr :id, :string, required: true, doc: "A unique identifier for the Modal"

  attr :variant, :string,
    default: "base",
    values: ["small", "base", "large", "max"],
    doc: "The size of the modal."

  attr :src, :string,
    default: nil,
    doc:
      "The URL of the content to display within a Modal. If provided, the Modal will display the content from the provided URL and any children other than the ui-title-bar and ui-save-bar elements will be ignored."

  slot :title_bar, validate_attrs: true do
    attr :title, :string
  end

  attr :title, :string, default: nil, doc: "Title of the Modal"

  attr :phx_hook, :string, default: "ShopifyAppBridgeModal"

  slot :static_iframe

  slot :primary_action,
    validate_attrs: true,
    doc: "Primary action for the modal. Only one will be rendered" do
    ComplexAction.attributes()
  end

  slot :secondary_action,
    validate_attrs: true,
    doc: "Secondary action for the modal. Only one will be rendered" do
    ComplexAction.attributes()
  end

  def app_bridge_modal(assigns) do
    assigns = assigns |> assign_phx_bindings()

    ~H"""
    <ui-modal
      id={modal_id(@id)}
      variant={@variant}
      src={@src}
      {@bindings}
      data-show={show(@id)}
      data-hide={hide(@id)}
      hidden
    >
      <div>
        {render_slot(@static_iframe)}
      </div>
      <ui-title-bar title={@title}>
        <button
          :for={{action, index} <- Enum.with_index(@primary_action)}
          variant="primary"
          tone={action[:tone]}
          onclick={proxy_click(@id, index, :primary)}
        >
          {action[:content]}
        </button>
        <button
          :for={{action, index} <- Enum.with_index(@secondary_action)}
          tone={action[:tone]}
          onclick={proxy_click(@id, index, :secondary)}
        >
          {action[:content]}
        </button>
      </ui-title-bar>
    </ui-modal>
    <.button
      :for={{action, index} <- Enum.with_index(@primary_action)}
      {action}
      hidden
      id={button_id(@id, index, :primary)}
      display="none"
    />
    <.button
      :for={{action, index} <- Enum.with_index(@secondary_action)}
      {action}
      hidden
      id={button_id(@id, index, :secondary)}
      display="none"
    />
    """
  end

  def show(js \\ %JS{}, id),
    do: JS.dispatch(js, "polaris:app_bridge_modal_show_" <> modal_id(id), to: "##{modal_id(id)}")

  def hide(js \\ %JS{}, id),
    do: JS.dispatch(js, "polaris:app_bridge_modal_hide_" <> modal_id(id), to: "##{modal_id(id)}")

  def modal_id(id) when is_binary(id), do: "Modal" <> id

  def proxy_click(id, index, variant),
    do: "document.getElementById('#{button_id(id, index, variant)}').click()"

  def button_id(id, index, variant), do: Enum.join([id, index, to_string(variant), "button"], "-")

  def push_open(socket, id),
    do:
      Phoenix.LiveView.push_event(socket, "octantis:app_bridge_modal_show_" <> modal_id(id), %{})

  def push_close(socket, id),
    do:
      Phoenix.LiveView.push_event(socket, "octantis:app_bridge_modal_hide_" <> modal_id(id), %{})
end
