defmodule PetCare.Dogs do
<<<<<<< HEAD
  @moduledoc """
  Manage CRUD operations for the `Dogs` resource.
  """

  alias PetCare.Dogs.Dog
  alias PetCare.Repo

  @doc """
  Creates a new dog in the system.
  """
=======
  alias PetCare.Dogs.Dog
  alias PetCare.Repo

  # create
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def create_dog(params) do
    params
    |> Dog.changeset()
    |> Repo.insert()
  end

<<<<<<< HEAD
  @doc """
  Deletes a dog by its ID.
  """
=======
  # delete
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def delete_dog(id) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> Repo.delete(dog)
    end
  end

<<<<<<< HEAD
  @doc """
  Retrieves details of a dog by its ID.
  """
=======
  # get
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def get_dog(id) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> {:ok, dog}
    end
  end

<<<<<<< HEAD
  @doc """
  Updates a dog's information by its ID.
  """
=======
  # update
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
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
