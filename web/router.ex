defmodule Summit360Www.Router do
  use Summit360Www.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Summit360Www do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/contact", PageController, :contact
  end


  # Other scopes may use custom stacks.
  # scope "/api", Summit360Www do
  #   pipe_through :api
  # end
end
