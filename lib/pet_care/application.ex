defmodule PetCare.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PetCareWeb.Telemetry,
      PetCare.Repo,
      {DNSCluster, query: Application.get_env(:pet_care, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PetCare.PubSub},
      # Start a worker by calling: PetCare.Worker.start_link(arg)
      # {PetCare.Worker, arg},
      # Start to serve requests, typically the last entry
      PetCareWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PetCare.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetCareWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
