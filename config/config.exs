# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phxApp,
  ecto_repos: [PhxApp.Repo]

# Configures the endpoint
config :phxApp, PhxAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qE9U/trPC0mXXPviBQ++ortGKTNbz8yhK+u+gH6FLCtRl0d0gH9MOs7NRRabDv3+",
  render_errors: [view: PhxAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxApp.PubSub,
           adapter: Phoenix.PubSub.PG2]


config :phxApp, PhxApp.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.zoho.com",
  hostname: "hoovi.in",
  port: 587,
  username: "noreply@hoovi.in", # or {:system, "SMTP_USERNAME"}
  password: "hoovimails", # or {:system, "SMTP_PASSWORD"}
  tls: :if_available, # can be `:always` or `:never`
  allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"], # or {":system", ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
  ssl: false, # can be `true`
  retries: 1,
  no_mx_lookups: false, # can be `true`
  auth: :if_available # can be `always`. If your smtp relay requires authentication set it to `always`.
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

   Application.put_env(:mailchimp, :api_key, "ca23974aefaeda81d3f74faacfc25752-us18")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
