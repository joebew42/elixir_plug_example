use Mix.Config

config :elixir_plug_example, collaborator: RealCollaborator

import_config "#{Mix.env}.exs"
