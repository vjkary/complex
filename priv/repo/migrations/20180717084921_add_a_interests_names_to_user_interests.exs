defmodule PhxApp.Repo.Migrations.AddAInterestsNamesToUserInterests do
  use Ecto.Migration

  def change do
 alter table(:users_interests_new) do
      add :interest_name, :string
  end
  end
end
