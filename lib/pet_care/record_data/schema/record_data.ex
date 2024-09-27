defmodule PetCare.RecordData.Schema.RecordData do
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.Tutors.Schema.Tutor
  alias PetCare.Dogs.Schema.Dog
  alias PetCare.Veterinarians.Schema.Veterinarian

  @required_params [:date_time, :tutor_id, :dog_id, :veterinarian_id]

  schema "record_data" do
    field :date_time, :utc_datetime
    belongs_to :tutor, Tutor
    belongs_to :dog, Dog
    belongs_to :veterinarian, Veterinarian

    timestamps()
  end

  def changeset(record_data \\ %__MODULE__{}, params) do
    record_data
    |> cast(params, [@required_params])
    |> validate_required([@required_params])
  end
end
