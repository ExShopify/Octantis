defmodule OctantisWeb.Components.Head do
  @moduledoc """
  The stylesheet to make polaris work.

  ## Example
    <%!-- lib/octantis_web/live/shop_admin/layouts/root.html.heex --%>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="csrf-token" content={get_csrf_token()} />
        <meta name="shopify-api-key" content={OctantisWeb.Config.api_key()} />

        <OctantisWeb.Components.Head.stylesheet \>
        <OctantisWeb.Components.Head.javascript \>

        <script defer data-phx-track-static type="text/javascript" src={~p"/assets/shop_admin.js"}>
      <head/>
      <body style="background-color: var(--p-color-bg-app); color: var(--p-color-text);">
        {@inner_content}
      </body>
    </html>
  """

  use Phoenix.Component

  attr :version, :string, default: "13.9.0", doc: "The polaris version"

  def stylesheet(assigns) do
    ~H"""
    <%!-- Polaris CSS --%>
    <link
      rel="stylesheet"
      href={"https://unpkg.com/@shopify/polaris@#{@version}/build/esm/styles.css"}
    />
    <link rel="stylesheet" href="https://cdn.shopify.com/static/fonts/inter/v4/styles.css" />
    """
  end

  def javascript(assigns) do
    ~H"""
    <%!-- AppBridge JS --%>
    <script src="https://cdn.shopify.com/shopifycloud/app-bridge.js">
    </script>
    """
  end
end
