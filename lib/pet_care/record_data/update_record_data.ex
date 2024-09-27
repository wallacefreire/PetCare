defmodule PetCare.RecordData.UpdateRecordData do
  alias PetCare.RecordData.Schema.RecordData
  alias PetCare.Repo

  def call(%{"id" => id} = params) do
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
