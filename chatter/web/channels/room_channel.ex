defmodule Chatter.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", message, socket) do
    {:ok, socket}
  end

  # web/channels/room_channel.ex
  def handle_in("new:message", msg, socket) do
    broadcast! socket, "new:message", %{user: msg["user"], body: msg["body"]}
    {:noreply, socket}
  end
end
