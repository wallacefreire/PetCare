defmodule PetCare.RecordData.RecordData do
  @moduledoc """
  Represents a record of an animal consultation or appointment in the pet care system.

  Each record associates a tutor, a dog, and a veterinarian with the specific date and time of the consultation.
  This provides a log of each appointment, detailing which pet was seen by which veterinarian and when.
  """

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

  @doc """
  Builds a changeset for validating and saving consultation record data

  ## Validations
    - Ensures the presence of `date_time`, `tutor_id`, `dog_id`, and `veterinarian_id`.
    - Enforces foreign key constraints on `tutor_id`, `dog_id`, and `veterinarian_id` to ensure each record is linked to existing data.
  """
  def changeset(record_data \\ %__MODULE__{}, params) do
    record_data
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> foreign_key_constraint(:tutor_id)
    |> foreign_key_constraint(:dog_id)
    |> foreign_key_constraint(:veterinarian_id)
  end
end
