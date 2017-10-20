defmodule PlugExample.HelloRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  @collaborator Application.get_env(:elixir_plug_example, :collaborator) || MockCollaborator

  get "/" do
    send_resp(conn, 200, "hello world")
  end

  get "/collaborator" do
    {:ok, response} = @collaborator.save("something")
    send_resp(conn, 200, response)
  end

  post "/users" do
    {:ok, body, _conn} = read_body(conn)
    send_resp(conn, 201, body)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
