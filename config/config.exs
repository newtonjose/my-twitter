# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :my_twitter,
  ecto_repos: [MyTwitter.Repo]

# Configures the endpoint
config :my_twitter, MyTwitterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WFd2BwQZyj2hO7dt7yFHYunWitbwQEP28rG5/mqJ50bafE40+LQk/oqKXxHgdzD5",
  render_errors: [view: MyTwitterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyTwitter.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "PaGUNkHI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
