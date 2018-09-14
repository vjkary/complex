defmodule PhxApp.Repo.Migrations.AddCorporateIdUsers do
  use Ecto.Migration

  def change do
alter table(:users) do
      add :corporate_id,references(:corporate, on_delete: :nothing)
      
  end
end
end