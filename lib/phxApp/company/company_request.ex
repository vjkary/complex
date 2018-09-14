defmodule PhxApp.Company.Company_request do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxApp.Company.Company_request

  schema "company_requests" do
    field :company_name, :string
    field :domain_name, :string
    field :email, :string
    field :is_email_verified, :boolean, default: false
    field :transport_type, :string
    # field :user_id, :id

    timestamps()
      belongs_to :users, PhxApp.Accounts.User, foreign_key: :user_id 
  end

  @doc false
  def changeset(company_request, attrs) do
    company_request
    |> cast(attrs, [:company_name, :domain_name, :email, :is_email_verified, :transport_type, :user_id])
    # |> validate_required([:company_name, :domain_name, :email, :is_email_verified, :transport_type])
  end
end
