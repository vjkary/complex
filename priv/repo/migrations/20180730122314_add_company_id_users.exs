defmodule PhxApp.Repo.Migrations.AddCompanyIdUsers do
  use Ecto.Migration

  def change do
		alter table(:users) do
        add :company_id, references(:company_master, on_delete: :nothing)
end
end
end