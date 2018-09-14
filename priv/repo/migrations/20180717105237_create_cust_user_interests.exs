defmodule PhxApp.Repo.Migrations.CreateCustUserInterests do
  use Ecto.Migration

  def change do
    create table(:cust_user_interests) do
      add :interest_names, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:cust_user_interests, [:user_id])
    create index(:cust_user_interests, [:category_id])
  end
end
