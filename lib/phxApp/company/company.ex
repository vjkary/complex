defmodule PhxApp.Company do
	import Ecto.Query, warn: false
  
 
  alias PhxApp.Repo
	
	alias PhxApp.Email
	alias PhxApp.Mailer
	alias PhxApp.Company
	alias PhxApp.Accounts.User
	alias PhxApp.Company.Company_request
	alias PhxApp.Accounts.UsersTokens
	alias PhxApp.Company.Company_master
    alias PhxApp.Company.CompanyUsersMap

  def ps_create_company_request(attrs \\ %{}) do

 company_request_data =  Repo.get_by(Company_request,user_id: attrs.user_id)

  IO.inspect company_request_data
  case company_request_data do

    nil->
    	 %Company_request{}
        |> Company_request.changeset(attrs)
        |> Repo.insert()
    _ ->

 company_request_data = Ecto.Changeset.change company_request_data, [email: attrs.email, is_email_verified: false, designation: attrs.designation, transport_type: attrs.transport_type, company_name: attrs.company_name]
    case Repo.update company_request_data do
      {:ok, struct}  ->  {:ok, struct}
      {:error, changeset}  ->  {:error, changeset}
    end

 end
        

        email = attrs.email

        confirm_id = random_string(10)
       attrs1 = %{:user_id => attrs.user_id, :token => confirm_id}
      IO.inspect attrs1
       %UsersTokens{}
        |> UsersTokens.changeset(attrs1)
        |> Repo.insert()
      #UsersTokens 
     # IO.inspect  TokenHelper.activation_url(PhxApp.Endpoint, :confirm, confirm_id: confirm_id)
    body ="<p>Thanks for signing up with Hoovi! :)</p>
            <p>Please click the link below to verify your corporate email address</p>
            <a href=http://0.0.0.0:4000/corporaterequest/#{attrs.user_id}/#{confirm_id}>Verify Your Corporate Email address</a>"
    subject = "Hoovi Corporate Email Verification Required"
    Email.welcome_text_email(attrs.email,body,subject) |> Mailer.deliver_later
        


  end

  def random_string(length) do
  :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
end


  def ps_update_user_corporate_email(user_id,token) do
       
    user_token_data =  Repo.get_by(UsersTokens,user_id: user_id, token: token)
     IO.inspect user_token_data
  if user_token_data != nil  do
    token_matched = user_token_data.token==token
     IO.inspect token_matched
    
    if token_matched = true  do
      company_request = Repo.get_by(Company_request,user_id: user_id)
    company_request = Ecto.Changeset.change company_request, [is_email_verified: token_matched]
    case Repo.update company_request do
      {:ok, struct}  ->  {:ok, struct}
      {:error, changeset}  ->  {:error, changeset}
    end
    Repo.delete(user_token_data)
    
    end
  end

  
  end

  def ct_list_company_master do
  	Repo.all(Company_master)
  end


  def ps_create_company_user_mapper(attrs \\ %{}) do
  	 company_user_data =  Repo.get_by(CompanyUsersMap,user_id: attrs.user_id, company_email: attrs.company_email)

     IO.inspect company_user_data

      case company_user_data do
       nil ->

 		confirm_id = random_string(10)
       attrs1 = %{:user_id => attrs.user_id, :token => confirm_id}
      IO.inspect attrs1
       %UsersTokens{}
        |> UsersTokens.changeset(attrs1)
        |> Repo.insert()

         body ="<p>Thanks for signing up with Hoovi! :)</p>
            <p>Please click the link below to verify your corporate email address</p>
            <a href=http://0.0.0.0:4000/corporateverification/#{attrs.user_id}/#{confirm_id}/#{attrs.company_id}>Verify Your Corporate Email address</a>"
     
     subject = "Hoovi Corporate Email Verification Required"
    
    Email.welcome_text_email(attrs.company_email,body,subject) |> Mailer.deliver_later

    %CompanyUsersMap{}
        |> CompanyUsersMap.changeset(attrs)
        |> Repo.insert()
 

        _ ->
        
        diff_corp_email = company_user_data.company_email==attrs.company_email

        if diff_corp_email = false do
       company_user_data = Ecto.Changeset.change company_user_data, [company_email: attrs.company_email, is_company_email_verified: false, designation: attrs.designation, company_id: attrs.company_id]
   		 case Repo.update company_user_data do
      {:ok, struct}  ->  {:ok, struct}
      {:error, changeset}  ->  {:error, changeset}
  end

    end
    if diff_corp_email = true do
        
        IO.puts "Already email submitted for approval"

		end

      end
  end


  def ps_update_user_corporate_user_record(user_id,token,company_id) do
       
    user_token_data =  Repo.get_by(UsersTokens,user_id: user_id, token: token)
     IO.inspect user_token_data
  if user_token_data != nil  do
    token_matched = user_token_data.token==token
     IO.inspect token_matched

     IO.inspect company_id
    
    if token_matched = true  do
      company_request = Repo.get_by(User,id: user_id)
    company_request = Ecto.Changeset.change company_request, [company_id: company_id,is_corp_email_verified: token_matched]
    case Repo.update company_request do
      {:ok, struct}  ->  {:ok, struct}
      {:error, changeset}  ->  {:error, changeset}
    end
    Repo.delete(user_token_data)
    
    end
  end

  
  end

 
end
