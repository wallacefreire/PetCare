defmodule PetCare.Repo.Migrations.AddRecordDataTable do
  use Ecto.Migration

  def change do
    create table(:record_data) do
      add :date_time, :utc_datetime
      add :tutor_id, references(:tutors)
      add :dog_id, references(:dogs)
      add :veterinarian_id, references(:veterinarians)

      timestamps()
    end

    create index(:record_data, [:tutor_id])
    create index(:record_data, [:dog_id])
    create index(:record_data, [:veterinarian_id])
  end
end
