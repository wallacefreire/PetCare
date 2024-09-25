defmodule PetCare.Repo.Migrations.CreateEnderecosTable do
  use Ecto.Migration

  def change do
    create table(:enderecos) do
      add :cep, :string, null: false
      add :rua, :string
      add :number, :integer
      add :bairro, :string
      add :city, :string
      add :state, :string

      timestamps()
    end
  end
end
