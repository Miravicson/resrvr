defmodule Rsvp.MixProject do
  use Mix.Project

  def project do
    [
      app: :rsvp,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Rsvp.Application, []},
      extra_applications: [:logger, :runtime_tools ],
      applications: [:postgrex, :ecto, :ecto_sql]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:ecto, "~> 3.4"}, {:postgrex, "~> 0.15.3"}, {:ecto_sql, "~> 3.4"}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      init: ["ecto.create", "ecto.migrate", "run priv/repo/seed.exs"]
    ]
  end
end
