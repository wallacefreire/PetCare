defmodule PetCareWeb.RecordDataController do
  use PetCareWeb, :controller

  alias PetCare.RecordData.Schema.RecordData
  alias PetCare.RecordData, as: RecordDataCRUD

  action_fallback PetCareWeb.FallbackController

  def create(conn, params) do
    with {:ok, %RecordData{} = record_data} <- RecordDataCRUD.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, record_data: record_data)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %RecordData{} = record_data} <- RecordDataCRUD.delete(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, record_data: record_data)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %RecordData{} = record_data} <- RecordDataCRUD.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, record_data: record_data)
    end
  end

  def update(conn, params) do
    with {:ok, %RecordData{} = record_data} <- RecordDataCRUD.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, record_data: record_data)
    end
  end
end