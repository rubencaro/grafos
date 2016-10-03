defmodule Grafos.Layout.Staged do
  @moduledoc """
  Layout that arranges vertex in stages, much like Graphviz's _dot_ engine.
  """
  @behaviour Grafos.Layout

  def lay(graph), do: graph
end
