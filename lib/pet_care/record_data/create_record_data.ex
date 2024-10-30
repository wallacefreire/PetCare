defmodule PetCare.RecordData.CreateRecordData do
  alias PetCare.RecordData.Schema.RecordData
  alias PetCare.Repo

  def call(params) do
    params
    |> RecordData.changeset()
    |> Repo.insert()
  end
end
