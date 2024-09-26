defmodule PetCare.Veterinarians.DeleteVeterinarian do
  alias PetCare.Veterinarians.Schema.Veterinarian
  alias PetCare.Repo

  def call(id) do
    case Repo.get(Veterinarian, id) do
      nil -> {:error, :not_found}
      veterinarian -> Repo.delete(veterinarian)
    end
  end
end
