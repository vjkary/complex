defmodule PhxApp.Repo.Migrations.CreateCompanyMaster do
  use Ecto.Migration

  def change do
    create table(:company_master) do
      add :company_name, :string
      add :domain_name, :string
      add :offers, :string

      timestamps()
    end

  end
end
