defmodule ElixirPlugExampleTest do
  use ExUnit.Case
  doctest ElixirPlugExample

  test "greets the world" do
    assert ElixirPlugExample.hello() == :world
  end
end
