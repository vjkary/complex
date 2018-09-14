defmodule PhxApp.Interests.UserQuestions do
  use Ecto.Schema
  import Ecto.Changeset


  schema "user_questions_mapper" do
    field :is_matcher, :boolean, default: false
    field :rider_option, :string
    # field :ride_ider, :string
    # field :driver_id, :id
    # field :rider_id, :id
    # field :question_id, :id

    timestamps()
  
     belongs_to :users1, PhxApp.Accounts.User, foreign_key: :driver_id
     belongs_to :users3, PhxApp.Accounts.User, foreign_key: :ride_id
     belongs_to :users2, PhxApp.Accounts.User, foreign_key: :rider_id
     belongs_to :questions, PhxApp.Interests.Questions, foreign_key: :question_id

  end

  @doc false
  def changeset(user_questions, attrs) do
    user_questions
    |> cast(attrs, [:rider_option, :is_matcher, :driver_id, :rider_id, :question_id,:ride_id])
    # |> validate_required([:rider_option, :is_matcher])
  end
end
