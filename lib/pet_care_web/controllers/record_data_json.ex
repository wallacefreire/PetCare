defmodule PetCareWeb.RecordDataJSON do
  alias PetCare.RecordData.Schema.RecordData

  def create(%{record_data: record_data}) do
    %{
      message: "Data record created successfully",
      data: data(record_data)
    }
  end

  def delete(%{record_data: record_data}) do
    %{
      message: "Data record deleted successfully",
      data: data(record_data)
    }
  end

  def get(%{record_data: record_data}), do: %{data: data(record_data)}

  def update(%{record_data: record_data}) do
    %{
      message: "Data record updated successfully",
      data: data(record_data)
    }
  end

  defp data(%RecordData{} = record_data) do
    %{
      id: record_data.id,
      date_time: record_data.date_time
    }
  end
end
