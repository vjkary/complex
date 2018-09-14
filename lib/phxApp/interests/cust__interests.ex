defmodule PhxApp.Interests.Cust_Interests do
  use Ecto.Schema
  import Ecto.Changeset


  schema "cust_user_interests" do
    field :interest_names, :string
    field :user_id, :id
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(cust__interests, attrs) do
    cust__interests
    |> cast(attrs, [:interest_names,:user_id,:category_id])
    |> validate_required([:interest_names])
  end
end
