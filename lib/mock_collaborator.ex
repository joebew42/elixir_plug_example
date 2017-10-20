defmodule MockCollaborator do
  @behaviour Collaborator

  def save(_name), do: nil
end
