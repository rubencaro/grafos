defmodule Grafos.Graph.Attributes do
  @moduledoc """
  Module holding all possible `Graph` attributes
  """
  @type t :: %Grafos.Graph.Attributes{label: String.t}

  defstruct [:label]
end
