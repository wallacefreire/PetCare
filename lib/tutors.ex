defmodule PetCare.Tutors do
  alias PetCare.Tutors.Tutor
  alias PetCare.Repo

  # create
  def create_tutor(params) do
    params
    |> Tutor.changeset()
    |> Repo.insert()
  end

  # delete
  def delete_tutor(id) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> Repo.delete(tutor)
    end
  end

  # get
  def get_tutor(id) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> {:ok, tutor}
    end
  end

  # update
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
