defmodule Grafos.Layout do
  @moduledoc """
  Behaviour for all layouts.

  A Layout is responsible for the calculation of the position of every `Vertex` of a `Graph`.
  """

  @doc """
  Calculates the coordinates of every `Vertex` of the given `Graph` and puts
  them into their attributes.

  Any preexistent coordinate attributes of a `Vertex` are not overwritten.
  """
  @callback lay(Grafos.Graph.t) :: Grafos.Graph.t
end
