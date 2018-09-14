defmodule PhxAppWeb.Router do
  use PhxAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/"  do
    pipe_through :api
    

    forward "/api",
            Absinthe.Plug,
            schema: PhxAppWeb.GraphiQL.Schema


    forward "/graphiql",
            Absinthe.Plug.GraphiQL,
            schema: PhxAppWeb.GraphiQL.Schema,
            interface: :simple

   get "/verify/:id/:token", PhxAppWeb.UserController, :index
     get "/corporaterequest/:id/:token", PhxAppWeb.UserController, :corporate_request
      get "/corporateverification/:id/:token/:companyid", PhxAppWeb.UserController, :corporate_request_update_user
  end

 
end
