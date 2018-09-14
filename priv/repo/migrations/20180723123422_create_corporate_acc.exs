defmodule PhxApp.Repo.Migrations.CreateCorporateAcc do
  use Ecto.Migration

  def change do
    create table(:corporate_acc) do
      add :company_name, :string
      add :corporate_email, :string
      add :domain_name, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:corporate_acc, [:user_id])
  end
end
