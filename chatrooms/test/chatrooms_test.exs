defmodule ChatroomsTest do
  use ExUnit.Case
  doctest Chatrooms

  describe "testing the server" do
    test "testing the start" do
      listen_options = [
        :binary,
        active: false,
        reuseaddr, true
      ]

      
    end

  end
  describe "testing the client" do

    test "testing the start" do
      connect_options = [
        {:active, false},
        {:mode, :binary},
        {:packet, :line}
      ]
      {:ok, socket} = :gen_tcp.connect(:localhost, 5001, connect_options)
      assert :gen_tcp.send(socket, "this is the client") == :ok
      assert :gen_tcp.recv(socket, 0) == {:ok,"this is the client"}
      # assert
    end


    end


end
