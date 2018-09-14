defmodule PhxApp.Accounts.UsersTokens do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxApp.Accounts.UsersTokens


  schema "users_tokens" do
    field :token, :string
    # field :user_id, :id

    timestamps()
      belongs_to :users, PhxApp.Accounts.User, foreign_key: :user_id 
  end

  @doc false
  def changeset(users_tokens, attrs) do
    users_tokens
    |> cast(attrs, [:token,:user_id])
    |> validate_required([:token])
  end
end
