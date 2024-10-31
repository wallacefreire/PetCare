defmodule PetCare.RecordData do
  @moduledoc """
  Manages CRUD operations for `RecordData`, which represents records of pet consultations
  including veterinarian, tutor, pet, and the date and time of the consultation.
  """

  alias PetCare.RecordData.RecordData
  alias PetCare.Repo

  @doc """
  Creates a new record of a pet consultation.
  """
  def create_record_data(params) do
    params
    |> RecordData.changeset()
    |> Repo.insert()
  end

  @doc """
  Deletes a consultation record by its ID.
  """
  def delete_record_data(id) do
    case Repo.get(RecordData, id) do
      nil -> {:error, :not_found}
      record_data -> Repo.delete(record_data)
    end
  end

  @doc """
  Retrieves a consultation record by its ID.
  """
  def get_record_data(id) do
    case Repo.get(RecordData, id) do
      nil -> {:error, :not_found}
      record_data -> {:ok, record_data}
    end
  end

  @doc """
  Updates an existing consultation record.
  """
  def update_record_data(%{"id" => id} = params) do
    case Repo.get(RecordData, id) do
      nil -> {:error, :not_found}
      record_data -> update(record_data, params)
    end
  end

  def update(record_data, params) do
    record_data
    |> RecordData.changeset(params)
    |> Repo.update()
  end
end
