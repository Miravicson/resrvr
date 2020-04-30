defmodule RsvpWeb.PageController do
  use RsvpWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
