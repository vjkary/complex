defmodule PhxApp.Company.Company_master do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxApp.Company.Company_master


  schema "company_master" do
    field :company_name, :string
    field :domain_name, :string
    field :offers, :string

    timestamps()
  end

  @doc false
  def changeset(company_master, attrs) do
    company_master
    |> cast(attrs, [:company_name, :domain_name, :offers])
    # |> validate_required([:company_name, :domain_name, :offers])
  end
end
