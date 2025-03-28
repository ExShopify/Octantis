# Octantis

Octantis is an implementation of [Polaris Design System](https://polaris.shopify.com/) in Elixir for Phoenix LiveView. If you are building a ShopAdmin for your Shopify App (Shopify calls this [embedded app home](https://shopify.dev/docs/apps/build/admin) at times), and want to conform to the Shopify perscribed design system, then you will want to use Octantis.

Octantis provides Polaris LiveView components that you can drop into your LiveView Shop admin.

### Example

    ```heex
    <.card >
      <.text as="h2" variant="bodyMd">
        Welcome to The Littlest Marble Shop
      </.text>
    </.card>
    ```

## σ Octantis

[σ Octantis](https://en.wikipedia.org/wiki/Sigma_Octantis) is the current southern pole star in opposition to Polaris the current northen pole star.

## Other Resource

- [Elixir ShopifyAPI](https://github.com/orbit-apps/elixir-shopifyapi) is most of what you need to interact with Shopify APIs. Auth, Rest, Graphql, Webhooks and so on.
- [Elixir Shopify App](https://github.com/orbit-apps/elixir-shopify-app) is a template for building an App with Elixir ShopifyAPI. Currently it lacks a LiveView ShopAdmin as a default, but there is some work towards enabling that.
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

## Setup A LiveView Shop Admin

TODO

## AppBridge Integration

TODO

## Add Storybook and Routes

TODO

## Local Setup

### Grab the latest Polaris CSS

```bash
mix run priv/fetch_css.exs
```

### Run tests

```bash
mix check
```

### Run Storybook

```bash
mix phx.server
```

Navigate to [http://localhost:4040/storybook](http://localhost:4040/storybook)
