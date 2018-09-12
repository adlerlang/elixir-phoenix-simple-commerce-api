use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :shipt_ma, ShiptMaWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :shipt_ma, ShiptMa.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "shipt_ma_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
