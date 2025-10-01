# Octantis

Octantis is an implementation of [Polaris Design System](https://shopify.dev/docs/api/app-home/polaris-web-components) in Elixir for Phoenix LiveView. If you are building a ShopAdmin for your Shopify App (Shopify calls this [embedded app home](https://shopify.dev/docs/apps/build/admin) at times), and want to conform to the Shopify perscribed design system, then you will want to use Octantis.

Octantis provides Polaris LiveView components that you can drop into your LiveView Shop admin.

## Implementations

Ovtantis components are wrappers around two different implementations.

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
<.s_card>
  <.s_text type="strong">
    Welcome to The Littlest Marble Shop
  </.s_text>
</.s_card>
```

## σ Octantis

[σ Octantis](https://en.wikipedia.org/wiki/Sigma_Octantis) is the current southern pole star in opposition to Polaris the current northen pole star.

## Other Resource

- [Elixir ShopifyAPI](https://github.com/orbit-apps/elixir-shopifyapi) is most of what you need to interact with Shopify APIs. Auth, Rest, Graphql, Webhooks and so on.
- [Elixir Shopify App](https://github.com/ExShopify/elixir-shopify-app) is a template for building an App with Elixir ShopifyAPI. Currently it lacks a LiveView ShopAdmin as a default, but there is some work towards enabling that.
- [Polaris Design System](https://polaris.shopify.com/)
- [Shopify AppBridge](https://shopify.dev/docs/api/app-bridge) provides some functionality for the ShopAdmin, noteably toasts and navigation menues.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `octantis` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:octantis, "~> 0.1.0"}
  ]
end
```

### Install Hooks

In `assets/js/app.js` add

```javascript
import * as octantisHooks from "octantis"

let Hooks = { ...octantisHooks }

let liveSocket = new LiveSocket("/live_view_path", Socket, {hooks: Hooks})
```

## Setup A LiveView Shop Admin

TODO

## AppBridge Integration

TODO

## Add Storybook and Routes

TODO

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
