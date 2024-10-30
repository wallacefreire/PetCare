defmodule PetCare.RecordData.GetRecordData do
  alias PetCare.RecordData.Schema.RecordData
  alias PetCare.Repo

  def call(id) do
    case Repo.get(RecordData, id) do
      nil -> {:error, :not_found}
      record_data -> {:ok, record_data}
    end
  end
end
