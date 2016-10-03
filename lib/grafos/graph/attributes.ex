
defmodule Grafos.Graph.Attributes do
  @moduledoc """
  Module holding all possible `Graph` attributes
  """
  @type t :: %Grafos.Graph.Attributes{label: String.t, layout: atom, layout_opts: Grafos.Layout.Options.t}

  defstruct [:label, layout: Grafos.Layout.Staged, layout_opts: %Grafos.Layout.Options{}]
end
