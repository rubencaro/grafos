defmodule Grafos do
  @moduledoc """
  See README.md
  """

  @spec vertex(String.t, Keyword.t) :: Grafos.Vertex.t
  def vertex(id, attrs \\ []) do
    %Grafos.Vertex{id: id, attrs: attrs}
  end

end
