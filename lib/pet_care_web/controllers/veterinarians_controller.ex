defmodule PetCareWeb.VeterinariansController do
  use PetCareWeb, :controller

  alias PetCare.Veterinarians
  alias PetCare.Veterinarians.Veterinarian

  action_fallback PetCareWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Veterinarian{} = veterinarian} <- Veterinarians.create_veterinarian(params) do
      conn
      |> put_status(:created)
      |> render(:create, veterinarian: veterinarian)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Veterinarian{} = veterinarian} <- Veterinarians.delete_veterinarian(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, veterinarian: veterinarian)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Veterinarian{} = veterinarian} <- Veterinarians.get_veterinarian(id) do
      conn
      |> put_status(:ok)
      |> render(:get, veterinarian: veterinarian)
    end
  end

  def update(conn, params) do
    with {:ok, %Veterinarian{} = veterinarian} <- Veterinarians.update_veterinarian(params) do
      conn
      |> put_status(:ok)
      |> render(:update, veterinarian: veterinarian)
    end
  end
end
