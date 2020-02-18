use Mix.Config

# Configure your database
config :catcasts, Catcasts.Repo,
  username: "postgres",
  password: "example",
  database: "catcasts_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :catcasts, CatcastsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
