defmodule ExPolaris.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_polaris,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      preferred_cli_env: [
        check: :test
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # dev
      {:credo, "~> 1.7.0", only: [:dev, :test], runtime: false},
      # # eveyrthing else
      {:phoenix, "~> 1.7.0"},
      {:phoenix_live_view, "~> 1.0"},
      {:phoenix_storybook, "~> 0.6"}
    ]
  end

  defp aliases do
    [
      check: [
        "deps.unlock --check-unused",
        "compile --warnings-as-errors",
        "format --check-formatted",
        "test --raise",
        "credo"
      ]
    ]
  end
end
