defmodule PhxAppWeb.PageControllerTest do
  use PhxAppWeb.ConnCase
 @moduledoc """
  The Accounts context.
  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
  """
end
