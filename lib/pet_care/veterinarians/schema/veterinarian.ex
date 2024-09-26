defmodule PetCare.Veterinarians.Schema.Veterinarian do
  use Ecto.Schema
  import Ecto.Changeset

  schema "veterinarians" do
    field :name, :string

    timestamps()
  end

  def changeset(veterinarian \\ %__MODULE__{}, params) do
    veterinarian
    |> cast(params, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 3, max: 80)
  end
end
