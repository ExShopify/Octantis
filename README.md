# Octantis

Octantis is an implementation of [Polaris Design System](https://shopify.dev/docs/api/app-home/polaris-web-components) in Elixir for Phoenix LiveView. If you are building a ShopAdmin for your Shopify App (Shopify calls this [embedded app home](https://shopify.dev/docs/apps/build/admin) at times), and want to conform to the Shopify perscribed design system, then you will want to use Octantis.

Octantis provides Polaris LiveView components that you can drop into your LiveView Shop admin.

## Implementations

Octantis components are wrappers around two different implementations: `React` and `Web Components`.

### React

The `OctantisWeb.Components.Polaris` components largely match the html produced by [Polaris React](https://polaris-react.shopify.com/). This implementation is meant to read like the react implementations as much as possible.

```elixir
<.card>
  <.text as="h2" variant="bodyMd">
    Welcome to The Littlest Marble Shop
  </.text>
</.card>
```

### Web Components

The `OctantisWeb.Components.PolarisWC` components are a light wrapper around the new [Polaris Web Components](https://shopify.dev/docs/api/app-home/using-polaris-components). Some niceties have been added around responsive attributes with the `~s` sigil and type checking. Events are forwared through the `OctantisEventProxy` hook.

```elixir
<.s_section>
  <.s_heading>
    Welcome to The Littlest Marble Shop
  </.s_heading>
</.s_section>
```

## σ Octantis

[σ Octantis](https://en.wikipedia.org/wiki/Sigma_Octantis) is the current southern pole star in opposition to Polaris the current northen pole star.

## Other Resource

- [Elixir ShopifyAPI](https://github.com/orbit-apps/elixir-shopifyapi) is most of what you need to interact with Shopify APIs. Auth, Rest, Graphql, Webhooks and so on.
- [Elixir Shopify App](https://github.com/ExShopify/elixir-shopify-app) is a template for building an App with Elixir ShopifyAPI. Currently it lacks a LiveView ShopAdmin as a default, but there is some work towards enabling that.
- [Polaris Design System](https://polaris.shopify.com/)
- [Shopify AppBridge](https://shopify.dev/docs/api/app-bridge) provides some functionality for the ShopAdmin, noteably toasts and navigation menues.

## Installation

Octantis is [available in Hex](https://hex.pm/packages/octantis), the package can be installed
by adding `octantis` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:octantis, "~> 0.2.0"}
  ]
end
```

### Install Hooks

In `assets/js/app.js` add

```javascript
import * as octantisHooks from "octantis"

let Hooks = { ...octantisHooks }

let liveSocket = new LiveSocket("/live_view_path", Socket, {hooks: Hooks, bindingPrefix: "data-phx-"})
```

Note that the bindingPrefix of `"data-phx-"`. AppBridge and Polaris have a tendancy to remove attributes that do not have the `data-` prefix.

## Setup A LiveView Shop Admin

We recommend creating a new liveview endpoint with its own routes, templates, and JS just for your Shop Admin.

#### In `OctantisAppWeb.Endpoint`:
```elixir
socket "/shop_admin_live", Phoenix.LiveView.Socket, websocket: [connect_info: []]
```

#### In `OctantisAppAppWeb.Router`:
```elixir
pipeline :shop_admin do
  plug ShopifyAPI.Plugs.AdminAuthenticator
  plug ShopifyAPI.Plugs.PutShopifyContentHeaders
end

live_session :live_shop_admin,
  layout: {OctantisAppAppWeb.ShopAdminLive.Layouts, :app},
  root_layout: {OctantisAppAppWeb.ShopAdminLive.Layouts, :root},
  session: {OctantisAppAppWeb.ShopAdmin.Hooks.AssignScope, :build_session, []} do
  scope "/live_shop_admin", OctantisAppAppWeb do
    pipe_through :browser
    pipe_through :shop_admin

    live "/", ShopAdmin.DashboardLive.Index, :live
    live "/settings", ShopAdmin.SettingsLive.Index, :index
  end
end
```

#### In `assets/js/shop_admin.js`:
```javascript
// JS specific to LiveView in ShopAdmin

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import * as baseHooks from "./hooks"
import * as octantisHooks from "octantis"

let Hooks = { ...baseHooks, ...octantisHooks }
let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/shop_admin_live", Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}, bindingPrefix: "data-phx-"})

// Show progress bar on live navigation and form submits
window.addEventListener("phx:page-loading-start", _info => shopify.loading(true))
window.addEventListener("phx:page-loading-stop", _info => shopify.loading(false))

window.addEventListener("phx:page-loading-stop", info => {
  /*
    When navigating, AppBridge detects changes within a LiveView,
    however, it does not detect between LiveView navigation, even when it is
    correctly patching within a live_session. This re-emits a navigation event
    that AppBridge will detect.
  */
  const destination = new URL(info.detail.to).pathname
  if (info.detail.kind == "initial" && destination != window.location.pathname) {
    history.pushState(null, '', destination);
  } else {
    history.replaceState(null, '', destination);
  }
})

// connect if there are any LiveViews on the page
liveSocket.connect()

window.liveSocket = liveSocket
window.shopifyIdToken = shopify.idToken();
```

#### In `lib/octantis_app_web/live/shop_admin/layouts/root.html.heex`

```heex
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="csrf-token" content={get_csrf_token()} />
    <meta name="shopify-api-key" content={OctantisApp.Config.api_key()} />

    <%!-- Polaris CSS --%>
    <OctantisWeb.Components.Head.stylesheet />
    <%!-- AppBridge JS --%>
    <OctantisWeb.Components.Head.javascript />
    <script defer data-phx-track-static type="text/javascript" src={~p"/assets/shop_admin.js"}>
    </script>
  </head>
  <body>
    {@inner_content}
  </body>
</html>
```

#### In `lib/cotantis_app_web/live/shop_admin/layouts/app.html.heex`

```heex
<.ui_nav_menu>
  <:link name="Home" url="/live_shop_admin/" />
  <:link name="Settings" url="/live_shop_admin/settings" />
</.ui_nav_menu>

<main role="main" id="root">
  <.toast kind={:info} flash={@flash} id="toastinfo" />
  <.toast kind={:error} flash={@flash} id="toasterror" />

  <.s_query_container container_name="Page">
    <.s_page heading={@page_heading} id="PageRoot">
        {@inner_content}
    </.s_page>
    <.s_box padding="small"><%!-- spacer --%></.s_box>
  </.s_query_container>
</main>
```

## Local Setup

### Run tests

```bash
mix check
```

### Run Storybook

```bash
mix phx.server
```

Navigate to [http://localhost:4040/storybook](http://localhost:4040/storybook)
