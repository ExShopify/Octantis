import Config

# Configures the endpoint
config :octantis, OctantisWeb.Endpoint,
  render_errors: [
    formats: [html: OctantisWeb.ErrorHTML, json: OctantisWeb.ErrorJSON],
    layout: false
  ],
  url: [host: "localhost"],
  live_view: [signing_salt: "ohBcslqz"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.25.0",
  default: [
    args:
      ~w(js/storybook.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

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
