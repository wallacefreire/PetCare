defmodule PetCare.Veterinarians do
  alias PetCare.Veterinarians.Veterinarian
  alias PetCare.Repo

  # create
  def create_veterinarian(params) do
    params
    |> Veterinarian.changeset()
    |> Repo.insert()
  end

  # delete
  def delete_veterinarian(id) do
    case Repo.get(Veterinarian, id) do
      nil -> {:error, :not_found}
      veterinarian -> Repo.delete(veterinarian)
    end
  end

  # get
  def get_veterinarian(id) do
    case Repo.get(Veterinarian, id) do
      nil -> {:error, :not_found}
      veterinarian -> {:ok, veterinarian}
    end
  end

  # update
  def update_veterinarian(%{"id" => id} = params) do
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
