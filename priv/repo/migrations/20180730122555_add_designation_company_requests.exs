defmodule PhxApp.Repo.Migrations.AddDesignationCompanyRequests do
  use Ecto.Migration

  def change do
 	alter table(:company_requests) do
      add :designation, :string
  end
  end
end
