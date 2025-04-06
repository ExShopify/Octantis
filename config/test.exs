import Config

config :octantis, OctantisWeb.Endpoint,
  start: true,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7+5Gir4OI0zSK65KE5aH2KQyA+VpHRk5V46paM30M/TWG3cHz3I6uMRP98OvAXUA",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
