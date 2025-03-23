# Octantis

Octantis is an implementation of [Polaris Design System](https://polaris.shopify.com/) in Elixir for Phoenix LiveView.

## σ Octantis

[σ Octantis](https://en.wikipedia.org/wiki/Sigma_Octantis) is the current southern pole star in opposition to Polaris the current northen pole star.

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

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_polaris>.

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
