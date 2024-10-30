defmodule PetCare.Veterinarians.UpdateVeterinarian do
  alias PetCare.Veterinarians.Schema.Veterinarian
  alias PetCare.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Veterinarian, id) do
      nil -> {:error, :not_found}
      veterinarian -> update(veterinarian, params)
    end
  end

  defp update(veterinarian, params) do
    veterinarian
    |> Veterinarian.changeset(params)
    |> Repo.update()
  end
end
