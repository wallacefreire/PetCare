defmodule PetCareWeb.VeterinariansJSON do
  alias PetCare.Veterinarians.Schema.Veterinarian

  def create(%{veterinarian: veterinarian}) do
    %{
      message: "Created Veterinarian sucessfully",
      data: data(veterinarian)
    }
  end

  def delete(%{veterinarian: veterinarian}) do
    %{
      message: "veterinarian deleted sucessfully",
      data: data(veterinarian)
    }
  end

  def get(%{veterinarian: veterinarian}), do: %{data: data(veterinarian)}

  def update(%{veterinarian: veterinarian}) do
    %{
      message: "Veterinarian updated sucessfully",
      data: data(veterinarian)
    }
  end

  def data(%Veterinarian{} = veterinarian) do
    %{
      id: veterinarian.id,
      name: veterinarian.name
    }
  end
end
