defmodule Rankme.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Rankme.Repo,
      # Start the Telemetry supervisor
      RankmeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rankme.PubSub},
      # Start the Endpoint (http/https)
      RankmeWeb.Endpoint
      # Start a worker by calling: Rankme.Worker.start_link(arg)
      # {Rankme.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rankme.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RankmeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
