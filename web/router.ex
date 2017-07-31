defmodule PhDelay.Router do
  use PhDelay.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhDelay do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/delay_test", DelayController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhDelay do
  #   pipe_through :api
  # end
end
