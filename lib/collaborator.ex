defmodule Collaborator do
  @callback save(String.t) :: {:ok, String.t}
end
