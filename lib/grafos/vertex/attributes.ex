defmodule Grafos.Vertex.Attributes do
  @moduledoc """
  Module holding all possible `Vertex` attributes
  """
  @type t :: %Grafos.Vertex.Attributes{label: String.t}

  defstruct [:label]
end
