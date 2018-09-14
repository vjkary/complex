defmodule PhxAppWeb.UserController do
  use PhxAppWeb, :controller

  def index(conn, _params) do
  	IO.inspect _params

  	id = String.to_integer(Map.get(_params, "id"))
  	
  	IO.inspect id

  	token = Map.get(_params, "token")

     PhxApp.Accounts.ps_update_user_detail_city(id,token)
  	
  	conn
  	 |> html("Thanks For registering with hoovi , Your Email is verified")
   
  end

   def corporate_request(conn, _params) do
    IO.inspect _params

    id = String.to_integer(Map.get(_params, "id"))
    
    IO.inspect id

    token = Map.get(_params, "token")

     PhxApp.Company.ps_update_user_corporate_email(id,token)
    
    conn
     |> html("Thanks For registering with hoovi , Your Corporate Request has been submitted")
   
  end

  def corporate_request_update_user(conn,_params) do
     id = String.to_integer(Map.get(_params, "id"))
     token = Map.get(_params, "token")
     company_id = String.to_integer(Map.get(_params, "companyid"))

   PhxApp.Company.ps_update_user_corporate_user_record(id,token,company_id)
      conn
     |> html("Thanks For registering with hoovi , Your Corporate email verification is done")

  end

end
