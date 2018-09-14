defmodule PhxApp.Repo.Migrations.AddCorporateFieldsToUsers do
  use Ecto.Migration

  def change do
alter table(:users) do
      add :corporate_account, :string
      add :is_corp_email_verified, :boolean
  end
end
end
