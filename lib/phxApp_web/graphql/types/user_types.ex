defmodule  PhxAppWeb.GraphiQL.Types.UserTypes do

  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PhxApp.Repo

  object :user_details do
    field :name, :string
    field :passwd, :string
    field :age, :integer
    field :users_details, list_of(:detail_users), resolve: assoc(:users_details)
    field :users_interests_new, list_of(:user_interest_list), resolve: assoc(:users_interests_new)
  end

object :detail_users do
    field :user_id, :id
    field :email, :string
    field :city, :string
 #   field :users, list_of(:user_details), resolve: assoc(:user)
  end


  input_object :params_update_user do
    [(field :name, :string),
    (field :age, :integer),
    (field :passwd, :string)]
  end

  input_object :param_boolean_verify do
    field :city, :string
  end

  object :city do
    field :city,:string
    field :user_id, :integer
  end

  # object :category_lists do
  # field :category_name, non_null(:string)
  #  end


  object :user_interest_list do
    field :user_id, :id
    field :interest_id, :string
    field :interest_name, :string
  end

object :user_interest_lists do
  field :count, :integer
end


object :user_interest_lists__question do
  field :id, :id
 field :questions, list_of(:questions_options)
end

object :questions_options do
  field :id, :id
  field :question, :string
  field :option1, :string
  field :option2, :string
  field :option3, :string
  field :option4, :string
  end

  object :user_question_mapper do
  field :driver_id, :integer
  field :rider_id,:integer
  field :ride_id, :integer
  field :question_id,:integer
  field :rider_option, :string
  end

  object :interst_answer_match do
    field :is_matched, :boolean
  end

  object :company_details do
    field :company_name, :string
    field :company_domain, :string
  end

  object :email_id do
    field :company_domain, :string
  end

end