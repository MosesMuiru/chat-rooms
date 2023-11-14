defmodule Chatrooms.Port do
  def definePort do
    IO.gets('enter the port')
    |> String.trim
    |> String.to_integer
  end
end
