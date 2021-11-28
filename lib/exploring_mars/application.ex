defmodule ExploringMars.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ExploringMars.Repo,
      # Start the Telemetry supervisor
      ExploringMarsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ExploringMars.PubSub},
      # Start the Endpoint (http/https)
      ExploringMarsWeb.Endpoint
      # Start a worker by calling: ExploringMars.Worker.start_link(arg)
      # {ExploringMars.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExploringMars.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExploringMarsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
