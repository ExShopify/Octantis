defmodule ExPolarisWeb.Router do
  use ExPolarisWeb, :router

  import PhoenixStorybook.Router, only: [storybook_assets: 0, live_storybook: 2]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ExPolarisWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/" do
    storybook_assets()
  end

  scope "/", ExPolarisWeb do
    pipe_through :browser

    live_storybook("/storybook", backend_module: ExPolarisWeb.Storybook)
  end
end
