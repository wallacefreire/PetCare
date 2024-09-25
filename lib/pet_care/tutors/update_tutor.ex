defmodule PetCare.Tutors.UpdateTutor do
  alias PetCare.Tutors.Schema.Tutor
  alias PetCare.Repo

  def call(%{"id" => id} = params) do
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
