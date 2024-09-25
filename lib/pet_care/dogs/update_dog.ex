defmodule PetCare.Dogs.UpdateDog do
  alias PetCare.Dogs.Schema.Dog
  alias PetCare.Repo

  def call(%{"id" => id} = params) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> update(dog, params)
    end
  end

  defp update(dog, params) do
    dog
    |> Dog.changeset(params)
    |> Repo.update()
  end
end
