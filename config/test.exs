import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :live_poll, LivePoll.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "live_poll_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :live_poll, LivePollWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "slQZN/1NYqM8oZ8Jm2rjOp2u3P5Zq7qmYsDeb+Hv98l0eaBif3AcfiO1W7K+keFc",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
