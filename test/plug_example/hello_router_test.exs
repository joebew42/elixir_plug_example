defmodule PlugExample.HellRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts PlugExample.HelloRouter.init([])

  test "returns hello world" do
    conn = conn(:get, "/")

    conn = PlugExample.HelloRouter.call(conn, @opts)

    assert :sent == conn.state
    assert 200 == conn.status
    assert "hello world" == conn.resp_body
  end

  test "returns a oops 404 when there is not matching endpoint" do
    conn = conn(:get, "/not_existing")

    conn = PlugExample.HelloRouter.call(conn, @opts)

    assert :sent == conn.state
    assert 404 == conn.status
    assert "oops" == conn.resp_body
  end
end
