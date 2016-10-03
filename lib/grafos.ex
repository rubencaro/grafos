require Grafos.Helpers, as: H

defmodule Grafos do
  @moduledoc """
  See README.md
  """

  @spec graph(String.t, Keyword.t | Map.t) :: Grafos.Graph.t
  def graph(id, attrs \\ []) do
    attrs = attrs |> H.defaults(label: id) |> H.to_struct(Grafos.Graph.Attributes)
    %Grafos.Graph{id: id, attrs: attrs}
    |> H.spit
  end

end
