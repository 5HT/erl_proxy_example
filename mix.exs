defmodule PROXY.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :erl_proxy_example,
      version: "0.7.1",
      elixir: "~> 1.7",
      description: "PLM Product Lifecycle Management",
      package: package(),
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(doc lib src mix.exs LICENSE),
      licenses: ["ISC"],
      maintainers: ["Eugene Bosiakov2"],
      name: :erl_proxy_example,
      links: %{"GitHub" => "https://github.com/bosiakov/erl_proxy_example"}
    ]
  end

  def application() do
    [
      mod: {:api_cowboy_app, []},
      applications: [:ranch, :cowboy, :lager, :hackney]
    ]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.20.2", only: :dev},
      {:hackney, "~> 1.15.1"},
      {:cowboy, "~> 2.6.3"},
      {:lager, "~> 3.8.0"}
    ]
  end
end
