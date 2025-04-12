defmodule OctantisWeb.Components.AppBridge do
  @moduledoc """
  AppBridge Components

  These components provide an interface for Shopify AppBridge

  See:
    - https://shopify.dev/docs/api/app-bridge
  """

  defdelegate toast(assigns), to: OctantisWeb.Components.AppBridge.Toast
end
