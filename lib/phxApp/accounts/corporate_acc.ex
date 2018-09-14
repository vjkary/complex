defmodule PhxApp.Accounts.CorporateAcc do
  use Ecto.Schema
  import Ecto.Changeset


  schema "corporate_acc" do
    field :company_name, :string
    field :corporate_email, :string
    field :domain_name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(corporate_acc, attrs) do
    corporate_acc
    |> cast(attrs, [:company_name, :corporate_email, :domain_name])
    |> validate_required([:company_name, :corporate_email, :domain_name])
  end
end
