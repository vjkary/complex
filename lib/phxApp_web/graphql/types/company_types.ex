defmodule  PhxAppWeb.GraphiQL.Types.CompanyTypes do

  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: PhxApp.Repo



	object :company_requests do
    	field :company_name, :string
    	field :email, :string
    	field :transport_type, :string
    	field :designation, :string
  end

    object :company_master_details do
    	field :id, :id
    	field :company_name, :string
    	field :domain_name, :string
    	field :offers, :string
    end

    object :corporate_user do
    	field :user_id, :integer
    	field :company_email, :string
    	field :company_id, :integer
    	field :designation, :string
    end

end