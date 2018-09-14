defmodule PhxApp.Repo.Migrations.CreateCorporate do
  use Ecto.Migration

  def change do
    create table(:corporate) do
      add :company_name, :string
      add :offers, :string
      add :company_domain, :string

      timestamps()
    end

  end
end
