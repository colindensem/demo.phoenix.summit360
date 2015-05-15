use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :summit360_www, Summit360Www.Endpoint,
  secret_key_base: "QhpwGzf4fcvqqEKhiL++MkpWkwfdP/ZcXwBpOzJ3yC5SJrqK1EomJ16DDTnIUd3a"

# Configure your database
config :summit360_www, Summit360Www.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "summit360_www_prod",
  size: 20 # The amount of database connections in the pool
