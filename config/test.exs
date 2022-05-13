import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ex_assistant, ExAssistant.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ex_assistant_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10,
  timeout: :infinity,
  ownership_timeout: :infinity

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex_assistant, ExAssistantWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ZclPf6S1skWI0JyZzKwufWU9JfVOVR6LZnYio7gytozUyXHYL8OXQjyoJmLnIueM",
  server: false

# In test we don't send emails.
config :ex_assistant, ExAssistant.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

config :ex_unit, timeout: :infinity

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
