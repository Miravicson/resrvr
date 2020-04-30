defmodule RsvpWeb.Router do
  use RsvpWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :authorized do
  #   plug :browser
  #   plug RsvpWeb.AuthorizedPlug
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RsvpWeb do
    pipe_through :browser

    get "/", PageController, :index


    get "/login", LoginController, :index
    post "/login", LoginController, :login
  end

  scope "/events", RsvpWeb do
    pipe_through :browser

    get "/", EventController, :list
    get "/new", EventController, :create
    post "/new", EventController, :add
    get "/:id", EventController, :show
    post "/:id/reserve", EventController, :reserve
  end

  # Other scopes may use custom stacks.
  # scope "/api", RsvpWeb do
  #   pipe_through :api
  # end
end
