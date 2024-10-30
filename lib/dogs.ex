defmodule PetCare.Dogs do
  alias PetCare.Dogs.Dog
  alias PetCare.Repo

  # create
  def create_dog(params) do
    params
    |> Dog.changeset()
    |> Repo.insert()
  end

  # delete
  def delete_dog(id) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> Repo.delete(dog)
    end
  end

  # get
  def get_dog(id) do
    case Repo.get(Dog, id) do
      nil -> {:error, :not_found}
      dog -> {:ok, dog}
    end
  end

  # update
  def update_dog(%{"id" => id} = params) do
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
