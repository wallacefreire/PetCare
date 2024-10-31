defmodule PetCare.Dogs do
  @moduledoc """
  Manage CRUD operations for the `Dogs` resource.
  """

  alias PetCare.Dogs.Dog
  alias PetCare.Repo

  @doc """
  Creates a new dog in the system.
  """
  def create_dog(params) do
    params
    |> Dog.changeset()
    |> Repo.insert()
  end

  @doc """
  Deletes a dog by its ID.
  """
  def delete_dog(id) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> Repo.delete(dog)
    end
  end

  @doc """
  Retrieves details of a dog by its ID.
  """
  def get_dog(id) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> {:ok, dog}
    end
  end

  @doc """
  Updates a dog's information by its ID.
  """
  def update_dog(%{"id" => id} = params) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> update(dog, params)
    end
  end

  defp update(dog, params) do
    dog
    |> Dog.changeset(params)
    |> Repo.update()
  end
end
