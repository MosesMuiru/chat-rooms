defmodule Chatrooms.Client do
  @moduledoc """
  here i will define client side of things

  """

  require Logger

  def start do
    connect_options = [
      {:active, false},
      {:mode, :binary},
      {:packet, :line}
    ]

    {:ok, socket} = :gen_tcp.connect(:localhost,4002, connect_options)

    sending(socket)

    :gen_tcp.close(socket)

    #  now i can send information to the client
  end

  def sending(socket) do
    :ok = :gen_tcp.send(socket, "hello from the servre\n")


    case :gen_tcp.recv(socket, 0) do
      {:ok, message} ->
        Logger.info(message)
        :gen_tcp.close(socket)
      {:error, error} -> Logger.error(error <> "server closed")
    end

  end
end
