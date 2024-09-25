defmodule PetCare.Tutors.CreateTutor do
  alias PetCare.Tutors.Schema.Tutor
  alias PetCare.Repo

  def call(params) do
    params
    |> Tutor.changeset()
    |> Repo.insert()
  end
end
