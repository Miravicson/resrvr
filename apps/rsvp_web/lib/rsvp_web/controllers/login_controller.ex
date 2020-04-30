defmodule RsvpWeb.LoginController do
  use RsvpWeb, :controller


  def index(conn, _params) do
    render(conn, "login.html")
  end

  def login(conn, %{"login" => %{"username" => username}}) do
    expiration = 60 * 60 * 24 * 7
    conn = Plug.Conn.assign(conn, :current_user, username)

    conn
    |> Plug.Conn.put_resp_cookie("username", username, max_age: expiration)
    |> redirect(  to: Routes.page_path(conn, :index))
  end
end
