defmodule PetCare.Dogs.Dog do
<<<<<<< HEAD
  @moduledoc """
  Represents a dog in the pet care system.

  Each dog is associated with a tutor (owner) and may have multiple records of consultations (record_data).
  Stores essential information such as the dog's name, breed, weight, and its tutor.
  """

=======
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.Tutors.Tutor
  alias PetCare.RecordData.RecordData

  @required_params [:name, :breed, :weight, :tutor_id]

  schema "dogs" do
    field :name, :string
    field :breed, :string
    field :weight, :float

    has_many :record_data, RecordData
    belongs_to :tutor, Tutor
    timestamps()
  end

<<<<<<< HEAD
  @doc """
  Builds a changeset for validating and saving dog data.

  ## Validations
    - Ensures the `name`, `breed`, `weight`, and `tutor_id` fields are present.
    - Validates that `weight` is greater than 0.
    - Enforces a foreign key constraint on `tutor_id` to ensure the dog is associated with an existing tutor.
  """
=======
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  def changeset(dog \\ %__MODULE__{}, params) do
    dog
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:weight, greater_than: 0)
    |> foreign_key_constraint(:tutor_id)
  end
end
