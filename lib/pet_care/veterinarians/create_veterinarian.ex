defmodule PetCare.Veterinarians.CreateVeterinarian do
  alias PetCare.Veterinarians.Schema.Veterinarian
  alias PetCare.Repo

  def call(params) do
    params
    |> Veterinarian.changeset()
    |> Repo.insert()
  end
end
