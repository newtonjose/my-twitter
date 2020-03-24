# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_twitter,
  ecto_repos: [MyTwitter.Repo]

# Configures the endpoint
config :my_twitter, MyTwitterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZLKztK4dA8Fh8tfzv0yAdmvRMu9ntIJ/C4AkXCjrrBMoyGO/I+h8tdmr7VXFHRr0",
  render_errors: [view: MyTwitterWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MyTwitter.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Guardian config details
config :my_twitter, MyTwitter.Guardian,
  issuer: "my_twitter",
  secret_key: "33R7tkfScRCGnJVFsB7eb+UE9PuFVvNRrJqmqGUwNCRui/fK+K28p/sEqlupH3Sg"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
