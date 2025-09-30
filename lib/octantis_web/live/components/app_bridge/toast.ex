defmodule OctantisWeb.Components.AppBridge.Toast do
  @moduledoc """
  Renders Shopify toast notices.

  Uses ShopifyToastHook to integrate with AppBridge

  Be sure to load in AppBridge js in your template (you can use `<OctantisWeb.Components.Head.javascript />` to do so).

  ## Examples
  ```elixir 
  <.toast kind={:info} flash={@flash} id="toastinfo" />
  <.toast kind={:error} flash={@flash} id="toasterror" />
  ```

  ## See 
  - https://shopify.dev/docs/api/app-bridge-library/reference/toast#example-toast-with-dismiss-callback
  """

  use Phoenix.Component

  attr :id, :string, default: "toast", doc: "the optional id of toast container"
  attr :flash, :map, default: %{}, doc: "the map of flash messages to display"
  attr :kind, :atom, values: [:info, :error], doc: "used for styling and flash lookup"
  attr :phx_hook, :string, default: "ShopifyToastHook", doc: "The hook to handle onDismiss"

  def toast(assigns) do
    ~H"""
    <div
      :if={msg = Phoenix.Flash.get(@flash, @kind)}
      id={@id}
      data-message={msg}
      data-kind={@kind}
      data-phx-hook={@phx_hook}
      hidden
    >
      {msg}
    </div>
    """
  end
end
