defmodule ElixirPlugExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elixir_plug_example,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [
        :cowboy,
        :plug
      ],
      mod: {PlugExample, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:mock, "~> 0.2.0", only: :test}
    ]
  end
end
