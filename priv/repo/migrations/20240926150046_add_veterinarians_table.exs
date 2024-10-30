defmodule PetCare.Repo.Migrations.AddVeterinariansTable do
  use Ecto.Migration

  def change do
    create table(:veterinarians) do
      add :name, :string, size: 80, null: false

      timestamps()
    end
  end

  def down do
    drop table(:veterinarians)
  end
end
