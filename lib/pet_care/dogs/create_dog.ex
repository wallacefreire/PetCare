defmodule PetCare.Dogs.CreateDog do
  alias PetCare.Dogs.Schema.Dog
  alias PetCare.Repo

  def call(params) do
    params
    |> Dog.changeset()
    |> Repo.insert()
  end
end
