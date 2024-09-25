defmodule PetCare.Tutors do
  alias PetCare.Tutors.CreateTutor
  alias PetCare.Tutors.DeleteTutor
  alias PetCare.Tutors.GetTutor
  alias PetCare.Tutors.UpdateTutor

  defdelegate create(params), to: CreateTutor, as: :call
  defdelegate delete(id), to: DeleteTutor, as: :call
  defdelegate get(id), to: GetTutor, as: :call
  defdelegate update(params), to: UpdateTutor, as: :call
end
