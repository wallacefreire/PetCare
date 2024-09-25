defmodule PetCareWeb.DogsJSON do
  alias PetCare.Dogs.Schema.Dog

  def create(%{dog: dog}) do
    %{
      message: "Created Dog sucessfully",
      data: data(dog)
    }
  end

  def delete(%{dog: dog}), do: %{message: "Dog deleted sucessfully", data: data(dog)}
  def get(%{dog: dog}), do: %{data: data(dog)}
  def update(%{dog: dog}), do: %{message: "Dog updated sucessfully", data: data(dog)}

  defp data(%Dog{} = dog) do
    %{
      id: dog.id,
      name: dog.name,
      breed: dog.breed,
      weight: dog.weight
    }
  end
end
