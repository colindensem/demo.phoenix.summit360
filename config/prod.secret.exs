use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :summit360_www, Summit360Www.Endpoint,
  secret_key_base: System.get_env("SUMMIT360_WWW_SECRET_KEY_BASE")

# # Configure your database
config :summit360_www, Summit360Www.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("SUMMIT360_WWW_PG_USERNAME"),
  password:System.get_env("SUMMIT360_WWW_PG_PASSWORD"),
  database: System.get_env("SUMMIT360_WWW_PG_DATABASE"),
  size: 20 # The amount of database connections in the pool


