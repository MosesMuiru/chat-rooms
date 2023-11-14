defmodule Chatrooms.Server do
  require Logger
  alias Chatrooms.Port

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

    # {:ok, listen_pid} = :gen_tcp.listen(Port.definePort, listen_options)

    case :gen_tcp.listen(Port.definePort, listen_options) do
      {:ok, listen_pid} ->
        Logger.info("server startted at 4000 msee")
        {:ok, socket} = :gen_tcp.accept(listen_pid)
        receive_connection(socket)
      {:error, :eaddrinuse} -> Logger.info("the port is in use enter another port")
        start()
    end


  end



  def receive_connection(socket) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, message} ->
        Logger.info("--> #{message}")
        :gen_tcp.send(socket, " manzee the server received the message..\n")
      {:error, error} -> error
    end

    receive_connection(socket)
    :gen_tcp.close(socket)
  end
end
