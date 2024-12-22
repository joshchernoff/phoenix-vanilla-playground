defmodule VanillaPlaygroundWeb.RoomChannel do
  use VanillaPlaygroundWeb, :channel

  @impl true
  def join("room:lobby", payload, socket) do
    IO.inspect(payload)
    {:ok, socket}
  end

  def join("room:posts", payload, socket) do
    IO.inspect(payload)
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Phoenix.PubSub.broadcast(VanillaPlayground.PubSub, "room:posts", {"likes", %{foo: :bar}})
  @impl true
  def handle_info({"likes", payload}, socket) do
    push(socket, "likes", payload)
    {:noreply, socket}
  end
end
