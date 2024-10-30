defmodule PetCare.Veterinarians.Veterinarian do
<<<<<<< HEAD
  @moduledoc """
  Schema for `Veterinarian`, representing a veterinarian in the pet care system.

  A veterinarian has a `name` and may be associated with multiple `RecordData` entries
  that log their consultations with pets.
  """

=======
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.RecordData.RecordData

  schema "veterinarians" do
    field :name, :string

    has_many :record_data, RecordData

    timestamps()
  end

<<<<<<< HEAD
  @doc """
  Creates a changeset for a `Veterinarian`.

  Validates the presence of `name`, ensuring it has a minimum length of 3 and a maximum of 80 characters.
  """
=======
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def changeset(veterinarian \\ %__MODULE__{}, params) do
    veterinarian
    |> cast(params, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 3, max: 80)
  end
end
