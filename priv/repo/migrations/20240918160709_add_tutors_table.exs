defmodule PetCare.Repo.Migrations.AddTutorsTable do
  use Ecto.Migration

  def change do
    create table(:tutors) do
      add :name, :string
      add :cpf, :string
      add :birth_date, :date
      add :password_hash, :string
      add :email, :string

      add :endereco_id, references(:enderecos)

      timestamps()
    end

    create unique_index(:tutors, [:email, :cpf])
    create index(:tutors, [:endereco_id])
  end
end
