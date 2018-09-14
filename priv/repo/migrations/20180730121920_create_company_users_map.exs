defmodule PhxApp.Repo.Migrations.CreateCompanyUsersMap do
  use Ecto.Migration

  def change do
    create table(:company_users_map) do
      add :company_email, :string
      add :designation, :string
      add :is_company_email_verified, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :company_id, references(:company_master, on_delete: :nothing)

      timestamps()
    end

    create index(:company_users_map, [:user_id])
    create index(:company_users_map, [:company_id])
  end
end
