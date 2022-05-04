# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :skilo_teste,
  ecto_repos: [SkiloTeste.Repo]

# Configures the endpoint
config :skilo_teste, SkiloTesteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bM89ljk7cV/k5oszzJE9TzzqFfyrcdzsnwBx//wQyKvXsvBnqhCOpvIpaWOzkLL/",
  render_errors: [view: SkiloTesteWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SkiloTeste.PubSub,
  live_view: [signing_salt: "zd2SuO1I"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :money,
  default_currency: :BRL

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
