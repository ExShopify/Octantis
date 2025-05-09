import Config

# Configures the endpoint
config :octantis, OctantisWeb.Endpoint,
  render_errors: [
    formats: [html: OctantisWeb.ErrorHTML, json: OctantisWeb.ErrorJSON],
    layout: false
  ],
  url: [host: "localhost"],
  live_view: [signing_salt: "ohBcslqz"]

# Configure esbuild for storybook
config :esbuild,
  version: "0.25.0",
  default: [
    args:
      ~w(js/storybook.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure esbuild to export the Octantis JS module
esbuild = fn args ->
  [
    args: ~w(./js/octantis --bundle) ++ args,
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]
end

config :esbuild,
  version: "0.25.0",
  module: esbuild.(~w(--format=esm --sourcemap --outfile=../priv/static/octantis.mjs)),
  main: esbuild.(~w(--format=cjs --sourcemap --outfile=../priv/static/octantis.cjs.js)),
  cdn:
    esbuild.(
      ~w(--target=es2016 --format=iife --global-name=Octantis --outfile=../priv/static/octantis.js)
    ),
  cdn_min:
    esbuild.(
      ~w(--target=es2016 --format=iife --global-name=Octantis --minify --outfile=../priv/static/octantis.min.js)
    )

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.2.4",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ],
  storybook: [
    args: ~w(
        --config=tailwind.config.js
        --input=css/storybook.css
        --output=../priv/static/assets/storybook.css
      ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
