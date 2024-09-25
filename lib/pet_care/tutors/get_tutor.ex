defmodule PetCare.Tutors.GetTutor do
  alias PetCare.Tutors.Schema.Tutor
  alias PetCare.Repo

  def call(id) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> {:ok, tutor}
    end
  end
end
