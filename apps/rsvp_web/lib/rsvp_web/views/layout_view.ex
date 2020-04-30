defmodule RsvpWeb.LayoutView do
  use RsvpWeb, :view

  def log_conn(conn), do: IO.inspect(conn)

  def format_username(username) do
    first_char =
      String.at(username, 0)
      |> String.upcase()
    first_char <> String.slice(username, 1, String.length(username))
  end
end
