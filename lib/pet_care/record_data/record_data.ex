defmodule PetCare.RecordData.RecordData do
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.Tutors.Tutor
  alias PetCare.Dogs.Dog
  alias PetCare.Veterinarians.Veterinarian

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
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> foreign_key_constraint(:tutor_id)
    |> foreign_key_constraint(:dog_id)
    |> foreign_key_constraint(:veterinarian_id)
  end
end
