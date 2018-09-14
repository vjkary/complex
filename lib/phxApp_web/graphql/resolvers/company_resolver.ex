defmodule PhxAppWeb.GraphiQL.Resolvers.CompanyResolver do

	alias PhxApp.Company

	def ct_company_request(_root, args, _info) do
    case Company.ps_create_company_request(args) do
      {:ok, company_requests} ->
        {:ok, company_requests}

      _error ->
        {:error, _error}
    end
  end

    def ct_list_all_company(_root, args, _info) do
    {:ok, Company.ct_list_company_master }
  end

  def ct_company_user_enroller(_root, args, _info) do
    case Company.ps_create_company_user_mapper(args) do
      {:ok, company_requests} ->
        {:ok, company_requests}

      _error ->
        {:error, _error}
    end
  end

end


 