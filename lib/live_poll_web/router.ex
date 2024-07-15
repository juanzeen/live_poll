defmodule LivePollWeb.Router do
  use LivePollWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LivePollWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LivePollWeb do
    pipe_through :browser

    live "/", PollLive.Index, :home
    live "/new", PollLive.Create, :new
    live "/details/:id", PollLive.Details, :view
  end

  # Other scopes may use custom stacks.
  # scope "/api", LivePollWeb do
  #   pipe_through :api
  # end
end
