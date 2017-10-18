defmodule PlugExample.HellRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  import Mock

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

  test "we call a collaborator" do
    with_mock Collaborator, [save: fn(_name) -> "this is a test" end] do
      conn = do_request(:get, "/collaborator")

      assert "this is a test" == conn.resp_body
    end
  end

  test "returns created when payload is correct" do
    payload = Poison.encode!(%{name: "joe"})
    conn = do_request(:post, "/users", payload)

    assert :sent == conn.state
    assert 201 == conn.status
    assert payload == conn.resp_body
  end

  defp do_request(verb, endpoint, payload) do
    conn(verb, endpoint, payload)
    |> @router.call(@opts)
  end

  defp do_request(verb, endpoint) do
    conn(verb, endpoint)
    |> @router.call(@opts)
  end
end
