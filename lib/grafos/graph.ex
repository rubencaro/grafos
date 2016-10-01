defmodule Grafos.Graph do
  @moduledoc """
  Module representing a group of `Vertex` or other `Graph` structs
  """

  @type t :: %Grafos.Graph{id: String.t,
                           members: maybe_improper_list(Grafos.Vertex.t, Grafos.Graph.t),
                           attrs: Grafos.Graph.Attributes.t}

  defstruct [:id, members: [], attrs: %Grafos.Graph.Attributes{}]
end
