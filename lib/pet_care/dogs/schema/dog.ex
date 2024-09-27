defmodule PetCare.Dogs.Schema.Dog do
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.Tutors.Schema.Tutor
  alias PetCare.RecordData.Schema.RecordData

  @required_params [:name, :breed, :weight]

  schema "dogs" do
    field :name, :string
    field :breed, :string
    field :weight, :float

    has_many :record_data, RecordData
    belongs_to :tutor, Tutor
    timestamps()
  end

  def changeset(dog \\ %__MODULE__{}, params) do
    dog
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:weight, greater_than: 0)
  end
end
