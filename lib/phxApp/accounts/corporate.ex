defmodule PhxApp.Accounts.Corporate do
  use Ecto.Schema
  import Ecto.Changeset

 alias PhxApp.Accounts.Corporate 
  schema "corporate" do
    field :company_domain, :string
    field :company_name, :string
    field :offers, :string
    field :is_corp_email_verified, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(corporate, attrs) do
    corporate
    |> cast(attrs, [:company_name, :offers, :company_domain,:is_corp_email_verified])
    # |> validate_required([:company_name, :offers, :company_domain])
  end
end
