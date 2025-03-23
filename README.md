# ExPolaris

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_polaris` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_polaris, "~> 0.1.0"}
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
