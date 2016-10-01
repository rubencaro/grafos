defmodule Grafos.Edge.Attributes do
  @moduledoc """
  Module holding all possible `Edge` attributes
  """
  @type t :: %Grafos.Edge.Attributes{label: String.t}
  
  defstruct [:label]
end
