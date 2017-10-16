defmodule PlugExample.HellRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @router PlugExample.HelloRouter
  @opts @router.init([])

  test "returns hello world" do
    conn = do_request(:get, "/")

    assert :sent == conn.state
    assert 200 == conn.status
    assert "hello world" == conn.resp_body
  end

  test "returns a oops 404 when there is not matching endpoint" do
    conn = do_request(:get, "/not_existing")

    assert :sent == conn.state
    assert 404 == conn.status
    assert "oops" == conn.resp_body
  end

  defp do_request(verb, endpoint) do
    conn(verb, endpoint)
    |> @router.call(@opts)
  end
end
