defmodule Grafos.Edge do
  @moduledoc """
  Module representing a connection between `Vertex`
  """
  @type t :: %Grafos.Edge{id: String.t,
                          origin: String.t,
                          target: String.t,
                          attrs: Grafos.Edge.Attributes.t}
                          
  defstruct [:id, :origin, :target, attrs: %Grafos.Edge.Attributes{}]
end
