defmodule PhxApp.AccountsTest do

    use PhxAppWeb.ConnCase
    use Phoenix.ConnTest
alias PhxApp.Accounts.User

  alias PhxApp.Accounts
 alias PhxApp.AbsintheHelpers

 describe "user fetching" do
    test "list_all_users/1 returns users list", context do
      #user_details = Accounts.list_users()

      query = """
      {
        list_all_users (id: 1) {
          name
          
        }
      }
      """

      res = context.conn
        |> post("/graphiql", AbsintheHelpers.query_skeleton(query, "user_details"))
        
      [result] = json_response(res, 200)["data"]["list_all_users"]

      assert result["name"] == "mknad"
    end
  end


  # def graphql_query(conn, options) do
  #   conn
  #   |> post("/graphiql", build_query(options[:query], options[:variables]))
  #   |> json_response(200)
  # end

  # defp build_query(query, variables) do
  #   %{
  #     "query" => query,
  #     "variables" => variables
  #   }
  # end

end


