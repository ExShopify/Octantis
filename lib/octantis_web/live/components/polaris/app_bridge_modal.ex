defmodule OctantisWeb.Components.Polaris.AppBridgeModal do
  @moduledoc """
  The AppBridge Modal API allows you to display an overlay that prevents interaction with the rest of the app until dismissed.

  It is used by customizing your Modal content with the ui-modal element and then opening it with the show() instance method or the shopify.modal.show("modal-id") API.

  Consider using OctantisWeb.Components.Polaris.Modal instead.

  ## Prerequisite

  The following is required in your .js file:

  ```javascript
  // Show and hide modal functions with AppBridge
  window.addEventListener("polaris:modal_show", e => e.target.show());
  window.addEventListener("polaris:modal_hide", e => e.target.hide());
  ```

  ## Push Events

  You can open and close the modal on the client from the server with

  ```javascript
  Hooks.ShopifyModal = {
    mounted(){
      id = this.el.id
      this.handleEvent(`polaris:modal_show_${id}`, (event) => this.el.show())
      this.handleEvent(`polaris:modal_hide_${id}`, (event) => this.el.hide())
    }
  }
  ```

  and

  ```elixir
  {:noreply, push_event(socket, "polaris:modal_show_\#{my_id}", %{})}
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

  slot :title_bar, validate_attrs: true do
    attr :title, :string
  end

  attr :title, :string, default: nil, doc: "Title of the Modal"

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
    <ui-modal id={@id} variant={@variant} {@bindings} hidden>
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

  def show(js \\ %JS{}, id), do: JS.dispatch(js, "polaris:modal_show", to: "##{id}")

  def hide(js \\ %JS{}, id), do: JS.dispatch(js, "polaris:modal_hide", to: "##{id}")

  def modal_id(id) when is_binary(id), do: "Modal" <> id

  def proxy_click(id, index, variant),
    do: "document.getElementById('#{button_id(id, index, variant)}').click()"

  def button_id(id, index, variant), do: Enum.join([id, index, to_string(variant), "button"], "-")
end
