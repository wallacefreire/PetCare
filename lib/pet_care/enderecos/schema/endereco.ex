defmodule PetCare.Enderecos.Schema.Endereco do
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.Tutors.Schema.Tutor

  @required_params [:cep, :rua, :number, :bairro, :city, :state]

  schema "enderecos" do
    field :cep, :string
    field :rua, :string
    field :number, :integer
    field :bairro, :string
    field :city, :string
    field :state, :string

    belongs_to :tutor, Tutor
    timestamps()
  end

  def changeset(endereco \\ %__MODULE__{}, params) do
    endereco
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cep, is: 8)
  end
end
