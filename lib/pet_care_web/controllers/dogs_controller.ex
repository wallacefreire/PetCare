defmodule PetCareWeb.DogsController do
  use PetCareWeb, :controller

  alias PetCare.Dogs
  alias PetCare.Dogs.Dog

  action_fallback PetCareWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Dog{} = dog} <- Dogs.create_dog(params) do
      conn
      |> put_status(:created)
      |> render(:create, dog: dog)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Dog{} = dog} <- Dogs.delete_dog(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, dog: dog)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Dog{} = dog} <- Dogs.get_dog(id) do
      conn
      |> put_status(:ok)
      |> render(:get, dog: dog)
    end
  end

  def update(conn, params) do
    with {:ok, %Dog{} = dog} <- Dogs.update_dog(params) do
      conn
      |> put_status(:ok)
      |> render(:update, dog: dog)
    end
  end
end
