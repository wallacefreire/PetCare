defmodule PetCare.RecordData do
  alias PetCare.RecordData.RecordData
  alias PetCare.Repo

  # create
  def create_record_data(params) do
    params
    |> RecordData.changeset()
    |> Repo.insert()
  end

  # delete
  def delete_record_data(id) do
    case Repo.get(RecordData, id) do
      nil -> {:error, :not_found}
      record_data -> Repo.delete(record_data)
    end
  end

  # get
  def get_record_data(id) do
    case Repo.get(RecordData, id) do
      nil -> {:error, :not_found}
      record_data -> {:ok, record_data}
    end
  end

  # update
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
