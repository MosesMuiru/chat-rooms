defmodule Chatrooms.Server do
  require Logger

  @moduledoc """
  here i will create the connection bettwen the two clients
  """
  def start do
    listen_options = [
      {:mode, :binary},
      {:active, false},
      {:packet, :line},
      {:reuseaddr, true}
    ]

    {:ok, listen_pid} = :gen_tcp.listen(4002, listen_options)

    Logger.info("server startted at 4000 msee")
    {:ok, socket} = :gen_tcp.accept(listen_pid)
    receive_connection(socket)
  end

  def receive_connection(socket) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, message} ->
        Logger.info("this is the message #{message}")
        :gen_tcp.send(socket, " manzee the server received the message..\n")
      {:error, error} -> error
    end

    receive_connection(socket)
    :gen_tcp.close(socket)
  end
end
