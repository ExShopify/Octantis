defmodule Octantis.MixProject do
  use Mix.Project

  @version "0.1.8"

  def project do
    [
      app: :octantis,
      version: @version,
      elixir: "~> 1.16",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      package: package(),
      source_url: "https://github.com/ExShopify/Octantis",
      description: description(),
      preferred_cli_env: [
        check: :test
      ],
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Octantis.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp package() do
    [
      name: "octantis",
      files:
        ~w(assets/js lib priv .formatter.exs mix.exs README* LICENSE* CHANGELOG* package.json),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/ExShopify/Octantis"}
    ]
  end

  defp description() do
    """
    An Elixir implementation of Shopify's Polaris design system.
    """
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support", "dev/support"]
  defp elixirc_paths(:dev), do: ["lib", "dev/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # dev
      {:credo, "~> 1.7.0", only: [:dev, :test], runtime: false},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:tailwind, "~> 0.3", runtime: Mix.env() == :dev},
      {:req, "~> 0.5.0", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      # # eveyrthing else
      {:esbuild, "~> 0.5", runtime: Mix.env() == :dev},
      {:phoenix, "~> 1.7.0"},
      {:phoenix_live_view, "~> 1.0"},
      {:phoenix_storybook, "~> 0.6"},
      {:plug_cowboy, "~> 2.5"}
    ]
  end

  defp aliases do
    [
      "assets.build": ["esbuild module", "esbuild cdn", "esbuild cdn_min", "esbuild main"],
      check: [
        "deps.unlock --check-unused",
        "compile --warnings-as-errors",
        "format --check-formatted",
        "test --raise",
        "credo"
      ]
    ]
  end

  defp docs() do
    [
      main: "readme",
      name: "Octantis",
      source_ref: "v#{@version}",
      canonical: "https://hexdocs.pm/octantis/",
      source_url: "https://github.com/ExShopify/Octantis",
      extras: [
        "README.md"
      ]
    ]
  end
end
