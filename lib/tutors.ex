defmodule PetCare.Tutors do
<<<<<<< HEAD
  @moduledoc """
  Manages CRUD operations for `Tutor`, which represents a pet owner in the system.
  Each tutor is associated with an address, which is created based on a provided postal code (CEP).
  """

  alias PetCare.Tutors.Tutor
  alias PetCare.Repo

  @doc """
  Creates a new tutor with the provided details.
  """
=======
  alias PetCare.Tutors.Tutor
  alias PetCare.Repo

  # create
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def create_tutor(params) do
    params
    |> Tutor.changeset()
    |> Repo.insert()
  end

<<<<<<< HEAD
  @doc """
  Deletes a tutor by their ID.
  """
=======
  # delete
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def delete_tutor(id) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> Repo.delete(tutor)
    end
  end

<<<<<<< HEAD
  @doc """
  Retrieves a tutor by their ID.
  """
=======
  # get
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def get_tutor(id) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> {:ok, tutor}
    end
  end

<<<<<<< HEAD
  @doc """
  Updates an existing tutor's information.
  """
=======
  # update
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def update_tutor(%{"id" => id} = params) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> update(tutor, params)
    end
  end

  defp update(tutor, params) do
    tutor
    |> Tutor.changeset(params)
    |> Repo.update()
  end
end
