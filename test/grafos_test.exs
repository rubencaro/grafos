alias Grafos, as: G

defmodule GrafosTest do
  use ExUnit.Case, async: true

  test "create graph" do
    assert %G.Graph{id: "G1", attrs: %{label: "G1"}} = G.graph("G1")
  end
end
