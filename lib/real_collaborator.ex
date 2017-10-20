defmodule RealCollaborator do
  @behaviour Collaborator

  def save(name) do
    {:ok, "saved" <> name}
  end
end
