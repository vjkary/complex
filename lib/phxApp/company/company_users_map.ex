defmodule PhxApp.Company.CompanyUsersMap do
  use Ecto.Schema
  import Ecto.Changeset
 alias PhxApp.Company.CompanyUsersMap
  schema "company_users_map" do
    field :company_email, :string
    field :designation, :string
    field :is_company_email_verified, :boolean, default: false
    # field :user_id, :id
    # field :company_id, :id

    timestamps()
      belongs_to :users, PhxApp.Accounts.User, foreign_key: :user_id 
      belongs_to :Company_master, PhxApp.Company.Company_master, foreign_key: :company_id 
  end

  @doc false
  def changeset(company_users_map, attrs) do
    company_users_map
    |> cast(attrs, [:company_email, :designation, :is_company_email_verified, :company_id, :user_id])
    # |> validate_required([:company_email, :designation, :is_company_email_verified])
  end
end
