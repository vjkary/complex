defmodule  PhxAppWeb.GraphiQL.Types.InterestTypes do

  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PhxApp.Repo
 import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :category_list do
  	field :category_name,:string
  end


	object :category_master_list do
    	field :category_id, :integer
    	field :interest_name, :string
 #   field :users, list_of(:user_details), resolve: assoc(:user)
  end

  object :category_id_interest_master do
   field :id, :id
      field :interest_name, :string
  end

  object :category_interest_master_list do
  		field :category_id, :integer
      field :id, :id
      field :interest_name, :string
      
      
 #   field :users, list_of(:user_details), resolve: assoc(:user)
  end

object :category_master_data do
 # interfaces [:category_items]
 field :category_id, :id
 field :categories, list_of(:category_id__array)
end
  
  object :category_id__array do
    field :category_id, :integer
    field  :id, :id
    field   :interest_name, :string

  end

  object :category_id_list do
    field :id, :id
    field :category_id, :integer
     field :interest_name, :string
  end

 


end