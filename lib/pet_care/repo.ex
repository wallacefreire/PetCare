defmodule PetCare.Repo do
  use Ecto.Repo,
    otp_app: :pet_care,
    adapter: Ecto.Adapters.Postgres
end
