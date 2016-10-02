defmodule Grafos.Layout.Options do
  @moduledoc """
  Common struct for all Layouts' options
  """
  @type t :: %Grafos.Layout.Options{dir: :ns | :sn | :ew | :we}

  defstruct [dir: :ns]
end
