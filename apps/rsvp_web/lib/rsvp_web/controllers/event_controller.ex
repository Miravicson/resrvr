defmodule RsvpWeb.EventController do
  use RsvpWeb, :controller

  # plug RsvpWeb.AuthorizedPlug when action in [:create]
  plug RsvpWeb.AuthorizedPlug, "create" when action in [:create]

  def show(conn, %{"id" => id}) do
    event =
    Rsvp.EventQueries.get_by_id(id)
    |> IO.inspect()
    render( conn, "details.html", event: event)
  end

  def list(conn, _params) do
    events = Rsvp.EventQueries.get_all()
    render(conn, "list.html", events: events)
  end

  def create(conn, %{error: %Ecto.Changeset{} = errors}) do
    # IO.puts("errors")
    # IO.inspect(errors)
    # errors = %{errors | date: nil}
    IO.inspect(errors.data)
    render(conn, "create.html", changeset: errors)
  end

  def create(conn, _params) do
    changeset = Rsvp.Events.changeset(%Rsvp.Events{}, %{})
    render(conn, "create.html", changeset: changeset)
  end

  def add(conn, %{"events" => events}) do


    changeset =  Rsvp.Events.changeset(%Rsvp.Events{}, events)
    # IO.inspect(changeset)

    case Rsvp.EventQueries.create(changeset) do
      {:ok, %{id: id}} -> redirect(conn, to: Routes.event_path(conn, :show, id))
      {:error, reasons} ->
        IO.inspect(reasons)
        create(conn, %{error: reasons})
    end
  end

  def reserve(conn, %{"reservation" => %{"quantity" => quantity}, "id" => id}) do
    event_tuple = Rsvp.EventQueries.decrease_quantity(id, quantity)
    RsvpWeb.EventChannel.send_update(event_tuple)
    redirect(conn, to: Routes.event_path(conn, :show, id))
  end
end
