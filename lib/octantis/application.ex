defmodule Octantis.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @start_endpoint Application.compile_env(:octantis, [OctantisWeb.Endpoint, :start], false)

  @impl true
  def start(_type, _args) do
    children =
      [
        # Start the Endpoint (http/https)
      ] ++ endpoint()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OctantisApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OctantisWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  def endpoint do
    if @start_endpoint do
      [OctantisWeb.Endpoint]
    else
      []
    end
  end
end
