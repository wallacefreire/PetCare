defmodule PetCare.Dogs.DeleteDog do
  alias PetCare.Dogs.Schema.Dog
  alias PetCare.Repo

  def call(id) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> Repo.delete(dog)
    end
  end
end
