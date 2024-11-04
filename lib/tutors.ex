defmodule PetCare.Tutors do
  @moduledoc """
  Manages CRUD operations for `Tutor`, which represents a pet owner in the system.
  Each tutor is associated with an address, which is created based on a provided postal code (CEP).
  """

  alias PetCare.Tutors.Tutor
  alias PetCare.Repo

  @doc """
  Creates a new tutor with the provided details.
  """
  def create_tutor(params) do
    params
    |> Tutor.changeset()
    |> Repo.insert()
  end

  @doc """
  Deletes a tutor by their ID.
  """
  def delete_tutor(id) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> Repo.delete(tutor)
    end
  end

  @doc """
  Retrieves a tutor by their ID.
  """
  def get_tutor(id) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> {:ok, tutor}
    end
  end

  @doc """
  Updates an existing tutor's information.
  """
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
