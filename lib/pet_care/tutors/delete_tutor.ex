defmodule PetCare.Tutors.DeleteTutor do
  alias PetCare.Tutors.Schema.Tutor
  alias PetCare.Repo

  def call(id) do
    case Repo.get(Tutor, id) do
      nil -> {:error, :not_found}
      tutor -> Repo.delete(tutor)
    end
  end
end
