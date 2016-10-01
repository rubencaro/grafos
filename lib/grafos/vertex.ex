defmodule Grafos.Vertex do
  @moduledoc """
  Represents a node of the graph.
  """
  @type t :: %Grafos.Vertex{id: String.t, attrs: Grafos.Vertex.Attributes.t}

  defstruct [:id, attrs: %Grafos.Vertex.Attributes{}]
end
