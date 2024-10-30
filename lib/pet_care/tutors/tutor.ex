defmodule PetCare.Tutors.Tutor do
<<<<<<< HEAD
  @moduledoc """
  Schema for `Tutor`, representing the owner of pets in the pet care system.

  Each tutor can have one address and multiple dogs, as well as records of consultations.
  """

=======
>>>>>>> bc88e7d (refactor: adjustments to CRUD controllers and functions)
  use Ecto.Schema
  import Ecto.Changeset

  alias PetCare.Addresses.Address
  alias PetCare.Dogs.Dog
  alias PetCare.RecordData.RecordData

  @required_params [:name, :cpf, :birth_date, :password, :email]

  schema "tutors" do
    field :name, :string
    field :cpf, :string
    field :birth_date, :date
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string

    has_one :address, Address
    has_many :dogs, Dog
    has_many :record_data, RecordData

    timestamps()
  end

  @doc """
  Creates a changeset for creating a new tutor.

  Validates required fields and ensures password hashing.
  """
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> do_validations()
    |> add_password_hash()
  end

  @doc """
  Creates a changeset for updating an existing tutor.

  Validates fields and applies password hashing if `password` is changed.
  """
  def changeset(tutor, params) do
    tutor
    |> cast(params, @required_params)
    |> validate_required([:name, :cpf, :birth_date, :email])
    |> do_validations()
    |> add_password_hash()
  end

  @doc """
  Applies additional validations for tutor fields.

  Ensures minimum length for `name`, `password`, and `cpf`, checks email format, and enforces unique constraints for `email` and `cpf`.
  """
  defp do_validations(changeset) do
    changeset
    |> validate_length(:name, min: 3)
    |> validate_length(:password, min: 4)
    |> validate_length(:cpf, min: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:cpf)
  end

  @doc """
  Adds a hashed password to the changeset if `password` is provided and valid.

  Uses the Argon2 hashing algorithm to securely store the password.
  """
  defp add_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    hash = Argon2.hash_pwd_salt(password)
    put_change(changeset, :password_hash, hash)
  end

  defp add_password_hash(changeset), do: changeset
end
