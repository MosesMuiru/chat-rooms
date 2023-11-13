defmodule ChatroomsTest do
  use ExUnit.Case
  doctest Chatrooms

  test "greets the world" do
    assert Chatrooms.hello() == :world
  end
end
