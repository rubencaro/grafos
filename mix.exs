defmodule Grafos.Mixfile do
  use Mix.Project

  def project do
    [app: :grafos,
     version: "0.1.0",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     test_coverage: [tool: Grafos.Cover, ignored: [Grafos.Helpers]],
     aliases: aliases,
     dialyzer: [plt_add_deps: :transitiv, flags: ["-Wunmatched_returns","-Werror_handling","-Wrace_conditions", "-Wunderspecs", "-q"]]]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [{:credo, "~> 0.4", only: [:dev, :test]},
     {:dialyxir, "~> 0.3.5", only: [:dev, :test]}]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp aliases do
    [test: ["test --cover", "credo", "dialyzer"]]
  end
end
