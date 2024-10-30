defmodule PetCare.Veterinarians.Veterinarian do
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.RecordData.RecordData

  schema "veterinarians" do
    field :name, :string

    has_many :record_data, RecordData

    timestamps()
  end

  def changeset(veterinarian \\ %__MODULE__{}, params) do
    veterinarian
    |> cast(params, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 3, max: 80)
  end
end
