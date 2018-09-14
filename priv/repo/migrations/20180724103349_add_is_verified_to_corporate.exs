defmodule PhxApp.Repo.Migrations.AddIsVerifiedToCorporate do
  use Ecto.Migration

  def change do
  	alter table(:corporate) do

 	add :is_corp_email_verified, :boolean
  end
end
end
