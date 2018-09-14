defmodule PhxApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxApp.Accounts.User 


  schema "users" do
    field :age, :integer
    field :name, :string
    field :passwd, :string
    field :company_id, :integer
    field :is_corp_email_verified,:boolean, default: false

    has_one :users_details, PhxApp.Accounts.Userdetail 
    has_one :users_interests_new, PhxApp.Accounts.UserInterestsNew
    timestamps()

    belongs_to :corporate, PhxApp.Accounts.User, foreign_key: :corporate_id 
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age, :passwd, :corporate_id,:company_id])
#    |> validate_required([:name, :age, :passwd])
  end
end
