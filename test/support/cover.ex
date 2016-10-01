defmodule Grafos.Cover do
  @moduledoc """
  Base taken from https://github.com/elixir-lang/elixir/blob/f2e9ac29389b4c4c1220318f24de58a580257dbd/lib/mix/lib/mix/tasks/test.ex#L2

  Just configure in mix.exs as an option of the project:

  ```elixir
  def project do
    [app: :grafos,
     ...,
     test_coverage: [tool: Grafos.Cover, ignored: [Grafos.Helpers]],
     aliases: aliases]
  end
  ```

  `:tool` should be this module, `:ignored` are modules not to be analysed

  Then run tests by `mix test --cover`.

  To make this the default you can define an alias on mix.exs too. This would
  run both `mix test --cover` and `mix credo` when you run `mix test`:

  ```elixir
  defp aliases do
    [test: ["test --cover", "credo"]]
  end
  ```
  """

  defstruct [:rate, :not_covered, :errors]

  def start(compile_path, opts) do
    Mix.shell.info "Cover compiling modules ..."
    _ = :cover.start

    case :cover.compile_beam_directory(compile_path |> to_charlist) do
      results when is_list(results) ->
        :ok
      {:error, _} ->
        Mix.raise "Failed to cover compile directory: " <> compile_path
    end

    fn() ->
      msg = opts |> get_results |> format_results
      Mix.shell.info "\nCover results ... #{msg}\n"
    end
  end

  defp get_results(opts) do
    {:result, ok, fail} = opts
      |> get_modules
      |> :cover.analyse(:coverage, :line)

    int = ok
      |> Enum.reject(&match?({{_, 0},_},&1))  # ignore line 0 results
    nc = int
      |> Enum.filter(fn({_, {_, n}}) -> n > 0 end)  # only those with any non covered results

    total = int |> Enum.count
    nc_count = nc |> Enum.count
    rate = (total - nc_count) / total

    %Grafos.Cover{rate: rate, not_covered: nc, errors: fail}
  end

  defp get_modules(opts) do
    ignored = opts[:ignored] || []

    :cover.modules
    |> Kernel.--(ignored)
    |> List.delete(__MODULE__)  # ignore this module too
  end

  defp format_results(%Grafos.Cover{} = data) do
    [:bright, "#{data.rate * 100.0 |> Float.round(2)}% coverage\n", :normal]
    |> add_not_covered(data.not_covered)
    |> add_errors(data.errors)
    |> IO.ANSI.format
  end

  defp add_not_covered(output, not_covered) do
    Enum.reduce(not_covered, output, fn({{m, l},_}, acc) ->
      acc ++ [:yellow, "\n -> #{m} at line #{l} not covered", :normal]
    end)
  end

  defp add_errors(output, []), do: output
  defp add_errors(output, errors) do
    output ++ ["\nErrors:\n", :red] ++ Enum.intersperse(errors, "\n") ++ [:normal]
  end
end
