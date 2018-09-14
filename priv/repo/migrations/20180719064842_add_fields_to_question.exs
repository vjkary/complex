defmodule PhxApp.Repo.Migrations.AddFieldsToQuestion do
  use Ecto.Migration

  def change do
 alter table(:questions) do
      add :interest_id, references(:categories_master, on_delete: :nothing)
  end
end
end
