defmodule PetCare.Veterinarians do
<<<<<<< HEAD
  @moduledoc """
  Manages CRUD operations for `Veterinarian`, representing a veterinarian in the pet care system.
  """

  alias PetCare.Veterinarians.Veterinarian
  alias PetCare.Repo

  @doc """
  Creates a new veterinarian with the provided details.

  ## Parameters
    - `params` (map): A map with veterinarian details, typically including their name.

  ## Returns
    - `{:ok, %Veterinarian{}}` if the veterinarian is created successfully.
    - `{:error, changeset}` if there is a validation error or if the insertion fails.
  """
=======
  alias PetCare.Veterinarians.Veterinarian
  alias PetCare.Repo

  # create
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def create_veterinarian(params) do
    params
    |> Veterinarian.changeset()
    |> Repo.insert()
  end

<<<<<<< HEAD
  @doc """
  Deletes a veterinarian by their ID.

  ## Parameters
    - `id` (integer): The ID of the veterinarian to delete.

  ## Returns
    - `:ok` if the veterinarian is deleted successfully.
    - `{:error, :not_found}` if the veterinarian is not found.
  """
=======
  # delete
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def delete_veterinarian(id) do
    case Repo.get(Veterinarian, id) do
      nil -> {:error, :not_found}
      veterinarian -> Repo.delete(veterinarian)
    end
  end

<<<<<<< HEAD
  @doc """
  Retrieves a veterinarian by their ID.

  ## Parameters
    - `id` (integer): The ID of the veterinarian to retrieve.

  ## Returns
    - `{:ok, %Veterinarian{}}` if the veterinarian is found.
    - `{:error, :not_found}` if the veterinarian is not found.
  """
=======
  # get
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def get_veterinarian(id) do
    case Repo.get(Veterinarian, id) do
      nil -> {:error, :not_found}
      veterinarian -> {:ok, veterinarian}
    end
  end

<<<<<<< HEAD
  @doc """
  Updates an existing veterinarian's information.

  ## Parameters
    - `params` (map): A map with updated details of the veterinarian, including the ID.

  ## Returns
    - `{:ok, %Veterinarian{}}` if the veterinarian is updated successfully.
    - `{:error, :not_found}` if the veterinarian is not found.
    - `{:error, changeset}` if there is a validation error during the update.
  """
=======
  # update
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
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
