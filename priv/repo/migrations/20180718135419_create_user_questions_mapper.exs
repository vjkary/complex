defmodule PhxApp.Repo.Migrations.CreateUserQuestionsMapper do
  use Ecto.Migration

  def change do
    create table(:user_questions_mapper) do
      add :rider_option, :string
      add :is_matcher, :boolean, default: false, null: false
      add :driver_id, references(:users, on_delete: :nothing)
      add :rider_id, references(:users, on_delete: :nothing)
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps()
    end

    create index(:user_questions_mapper, [:driver_id])
    create index(:user_questions_mapper, [:rider_id])
    create index(:user_questions_mapper, [:question_id])
  end
end
