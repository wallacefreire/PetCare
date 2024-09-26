defmodule PetCareWeb.TutorsController do
  use PetCareWeb, :controller

  alias PetCare.Tutors
  alias PetCare.Tutors.Schema.Tutor

  action_fallback PetCareWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Tutor{} = tutor} <- Tutors.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, tutor: tutor)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Tutor{} = tutor} <- Tutors.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, tutor: tutor)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Tutor{} = tutor} <- Tutors.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, tutor: tutor)
    end
  end

  def update(conn, params) do
    with {:ok, %Tutor{} = tutor} <- Tutors.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, tutor: tutor)
    end
  end
end
