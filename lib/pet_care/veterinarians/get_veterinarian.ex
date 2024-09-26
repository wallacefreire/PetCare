defmodule PetCare.Veterinarians.GetVeterinarian do
  alias PetCare.Veterinarians.Schema.Veterinarian
  alias PetCare.Repo

  def call(id) do
    case Repo.get(Veterinarian, id) do
      nil -> {:error, :not_found}
      veterinarian -> {:ok, veterinarian}
    end
  end
end
