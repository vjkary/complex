defmodule PhxApp.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :string
      add :option1, :string
      add :option2, :string
      add :option3, :string
      add :option4, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:questions, [:category_id])
  end
end
