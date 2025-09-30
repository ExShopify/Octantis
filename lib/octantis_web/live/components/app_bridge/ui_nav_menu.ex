defmodule OctantisWeb.Components.AppBridge.UiNavMenu do
  @moduledoc """
  Renders the AppBridge navigation menu `<ui-nav-menu/>`. This adds navigation elements for your app in the Shopify side bar.

  This catches the click events on the side navigation elements and turns them into calls to [`JS.navigate/1`](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.JS.html#navigate/1).
  This component allows navigation without a full page reload.

  Requires importing the hook `AppBridgeNavManu` in your Shop Admin js file. E.g. `import {AppBridgeNavManu} from "octantis"`

  ## Examples
  ```html
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta name="csrf-token" content={get_csrf_token()} />
      <meta name="shopify-api-key" content={SectionsApp.Config.api_key()} />

      <OctantisWeb.Components.Head.stylesheet />
      <OctantisWeb.Components.Head.javascript />

      <script defer data-phx-track-static type="text/javascript" src={~p"/assets/shop_admin.js"}>
      </script>

      <.ui_nav_menu>
        <:link name="Home" url="/shop_admin/" />
        <:link name="Settings" url="/shop_admin/settings" />
        <:link name="Contact" url="/shop_admin/contact" />
      </.ui_nav_menu>
    </head>
    <body style="background-color: var(--p-color-bg-app); color: var(--p-color-text);">
      {@inner_content}
    </body>
  </html>
  ```

  ## See
    - https://shopify.dev/docs/api/app-bridge-library/web-components/ui-nav-menu
  """

  use Phoenix.Component

  alias Phoenix.LiveView.JS

  attr :id, :string, default: "UiNavMenu", doc: "ID prefix for links"

  attr :hook, :string, default: "AppBridgeNavManu"

  slot :link, validate_attrs: true do
    attr :name, :string
    attr :url, :string
  end

  def ui_nav_menu(assigns) do
    assigns = assigns |> assign(:first_link, hd(assigns.link))

    ~H"""
    <ui-nav-menu>
      <.ui_nav_menu_link
        id={@id <> "First"}
        name={@first_link[:name]}
        url={@first_link[:url]}
        hook={@hook}
        rel="home"
      />
      <.ui_nav_menu_link
        :for={{%{name: name, url: url}, index} <- Enum.with_index(@link)}
        id={@id <> to_string(index)}
        name={name}
        url={url}
        hook={@hook}
      />
    </ui-nav-menu>
    """
  end

  attr :name, :string, required: true
  attr :url, :string, required: true
  attr :hook, :string, required: true
  attr :id, :string, required: true
  attr :rest, :global

  def ui_nav_menu_link(assigns) do
    ~H"""
    <a id={@id} data-phx-hook={@hook} data-nav-event={JS.navigate(@url)} href={@url} {@rest}>
      {@name}
    </a>
    """
  end
end
