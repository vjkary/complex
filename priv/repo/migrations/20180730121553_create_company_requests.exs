defmodule PhxApp.Repo.Migrations.CreateCompanyRequests do
  use Ecto.Migration

  def change do
    create table(:company_requests) do
      add :company_name, :string
      add :domain_name, :string
      add :email, :string
      add :is_email_verified, :boolean, default: false, null: false
      add :transport_type, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:company_requests, [:user_id])
  end
end
