defmodule PlugExample do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, PlugExample.HelloRouter, [], [port: 4000])
    ]

    opts = [strategy: :one_for_one, name: PlugExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
