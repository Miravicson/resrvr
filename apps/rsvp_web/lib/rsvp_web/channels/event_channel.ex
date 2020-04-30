defmodule RsvpWeb.EventChannel do
  use Phoenix.Channel

  @update_quantity "update_quantity"

  def join("event:" <> event_id, _message, _socket) when event_id <= "0" do
    {:error, %{reason: "invalid event id"}}
  end
  def join("event:" <> _event_id, _message, socket) do
    {:ok, socket}
  end

  def handle_in(@update_quantity = event, payload, socket) do

    broadcast(socket, event, payload)
    {:noreply, socket}
  end

  def send_update({:ok, %{id: id, quantity_available: quantity}}) do
    payload = %{
      quantity: quantity
    }
   RsvpWeb.Endpoint.broadcast("event:#{id}", @update_quantity, payload )
  end
end
