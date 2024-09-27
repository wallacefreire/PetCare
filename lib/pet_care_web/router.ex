defmodule PetCareWeb.Router do
  use PetCareWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PetCareWeb do
    pipe_through :api

    resources "/tutors", TutorsController, only: [:create, :update, :delete, :show]
    resources "/dogs", DogsController, only: [:create, :update, :delete, :show]

    resources "/record_data", RecordDataController,
      only: [
        :create,
        :update,
        :delete,
        :show
      ]

    resources "/veterinarians", VeterinariansController,
      only: [
        :create,
        :update,
        :delete,
        :show
      ]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:pet_care, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: PetCareWeb.Telemetry
    end
  end
end
