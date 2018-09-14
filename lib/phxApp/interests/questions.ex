defmodule PhxApp.Interests.Questions do
  use Ecto.Schema
  alias PhxApp.Interests.Questions
  import Ecto.Changeset


  schema "questions" do
    field :option1, :string
    field :option2, :string
    field :option3, :string
    field :option4, :string
    field :question, :string
    # field :category_id, :id

    timestamps()

     belongs_to :categories, PhxApp.Interests.Category, foreign_key: :category_id 
      belongs_to :categories_master, PhxApp.Interests.Category_Master, foreign_key: :interest_id 
  end

  @doc false
  def changeset(questions, attrs) do
    questions
    |> cast(attrs, [:question, :option1, :option2, :option3, :option4,:category_id, :interest_id])
    # |> validate_required([:question, :option1, :option2, :option3, :option4])
  end
end
