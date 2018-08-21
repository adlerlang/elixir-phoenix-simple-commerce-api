defmodule ShiptMaWeb.Router do
  use ShiptMaWeb, :router

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

  scope "/", ShiptMaWeb do
    pipe_through :browser # Use the default browser stack

    get "/orders", PageController, :index
    get "/api", PageController, :inventory
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShiptMaWeb do
  #   pipe_through :api
  # end
end
