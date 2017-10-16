defmodule PlugExample.HelloRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "hello world")
  end

  post "/users" do
    {:ok, body, _conn} = read_body(conn)
    send_resp(conn, 201, body)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
