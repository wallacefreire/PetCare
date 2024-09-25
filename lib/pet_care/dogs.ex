defmodule PetCare.Dogs do
  alias PetCare.Dogs.CreateDog
  alias PetCare.Dogs.DeleteDog
  alias PetCare.Dogs.GetDog
  alias PetCare.Dogs.UpdateDog

  defdelegate create(params), to: CreateDog, as: :call
  defdelegate delete(id), to: DeleteDog, as: :call
  defdelegate get(id), to: GetDog, as: :call
  defdelegate update(params), to: UpdateDog, as: :call
end
