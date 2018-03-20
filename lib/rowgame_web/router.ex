defmodule RowgameWeb.Router do
  use RowgameWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    resources "/users", UserController
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RowgameWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RowgameWeb do
  #   pipe_through :api
  # end
end
