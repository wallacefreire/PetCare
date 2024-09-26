defmodule PetCare.Repo.Migrations.AddDogsTable do
  use Ecto.Migration

  def change do
    create table(:dogs) do
      add :name, :string
      add :breed, :string
      add :weight, :float

      add :tutor_id, references(:tutors)

      timestamps()
    end

    create index(:dogs, [:tutor_id])
  end
end
