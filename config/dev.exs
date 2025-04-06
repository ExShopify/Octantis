import Config

config :octantis, OctantisWeb.Endpoint,
  start: true,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4040],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "7+5Gir4OI0zSK65KE5aH2KQyA+VpHRk5V46paM30M/TWG3cHz3I6uMRP98OvAXUA",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]},
    storybook_tailwind: {Tailwind, :install_and_run, [:storybook, ~w(--watch)]}
  ]

# Configures Elixir's Logger
config :logger, :console, format: "$time [$level] $message [$metadata]\n"

config :logger, :console, format: "[$level] $message\n"
