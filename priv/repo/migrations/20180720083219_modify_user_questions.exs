defmodule PhxApp.Repo.Migrations.ModifyUserQuestions do
  use Ecto.Migration

  def change do
alter table(:user_questions_mapper) do
      add :ride_id, references(:users, on_delete: :nothing)
  end
end
end

