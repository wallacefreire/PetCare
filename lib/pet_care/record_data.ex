defmodule PetCare.RecordData do
  alias PetCare.RecordData.CreateRecordData
  alias PetCare.RecordData.DeleteRecordData
  alias PetCare.RecordData.GetRecordData
  alias PetCare.RecordData.UpdateRecordData

  defdelegate create(params), to: CreateRecordData, as: :call
  defdelegate delete(id), to: DeleteRecordData, as: :call
  defdelegate get(id), to: GetRecordData, as: :call
  defdelegate update(params), to: UpdateRecordData, as: :call
end
