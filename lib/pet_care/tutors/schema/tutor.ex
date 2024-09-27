defmodule PetCare.Tutors.Schema.Tutor do
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.Enderecos.Schema.Endereco
  alias PetCare.Dogs.Schema.Dog
  alias PetCare.RecordData.Schema.RecordData

  @required_params [:name, :cpf, :birth_date, :password, :email]

  schema "tutors" do
    field :name, :string
    field :cpf, :string
    field :birth_date, :date
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string

    has_one :endereco, Endereco
    has_many :dogs, Dog
    has_many :record_data, RecordData

    timestamps()
  end

  # changeset create
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> do_validations()
    |> add_password_hash()
  end

  # changeset update
  def changeset(tutor, params) do
    tutor
    |> cast(params, @required_params)
    |> validate_required([:name, :cpf, :birth_date, :email])
    |> do_validations()
    |> add_password_hash()
  end

  defp do_validations(changeset) do
    changeset
    |> validate_length(:name, min: 3)
    |> validate_length(:password, min: 4)
    |> validate_length(:cpf, min: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:cpf)
  end

  defp add_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    hash = Argon2.hash_pwd_salt(password)
    put_change(changeset, :password_hash, hash)
  end

  defp add_password_hash(changeset), do: changeset
end
