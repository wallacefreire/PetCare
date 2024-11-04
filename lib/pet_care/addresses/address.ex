defmodule PetCare.Addresses.Address do
  @moduledoc """
  Represents an address in the pet care system.

  Each address is associated with a tutor
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.Tutors.Tutor

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

  @doc """
  Builds a changeset for validating and saving address data.

  ## Validations
    - Ensures the presence of all required fields (`cep`, `rua`, `number`, `bairro`, `city`, `state`).
    - Normalizes `cep` by removing any hyphens.
    - Validates that `cep` has exactly 8 characters.
  """
  def changeset(endereco \\ %__MODULE__{}, params) do
    endereco
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> update_change(:cep, &String.replace(&1, "-", ""))
    |> validate_length(:cep, is: 8)
  end
end
