defmodule PhxApp.CompanyTest do
  use PhxApp.DataCase

  alias PhxApp.Company



 @moduledoc """
  The Accounts context.
  
  describe "company_master" do
    alias PhxApp.Company.Company_master

    @valid_attrs %{company_n: "some company_n"}
    @update_attrs %{company_n: "some updated company_n"} assert response["data"]["updateUserName"]["name"] == "Aegon Targaryen
    @invalid_attrs %{company_n: nil}

    def company_master_fixture(attrs \\ %{}) do
      {:ok, company_master} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_company_master()

      company_master
    end

    test "list_company_master/0 returns all company_master" do
      company_master = company_master_fixture()
      assert Company.list_company_master() == [company_master]
    end

    test "get_company_master!/1 returns the company_master with given id" do
      company_master = company_master_fixture()
      assert Company.get_company_master!(company_master.id) == company_master
    end

    test "create_company_master/1 with valid data creates a company_master" do
      assert {:ok, %Company_master{} = company_master} = Company.create_company_master(@valid_attrs)
      assert company_master.company_n == "some company_n"
    end

    test "create_company_master/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_company_master(@invalid_attrs)
    end

    test "update_company_master/2 with valid data updates the company_master" do
      company_master = company_master_fixture()
      assert {:ok, company_master} = Company.update_company_master(company_master, @update_attrs)
      assert %Company_master{} = company_master
      assert company_master.company_n == "some updated company_n"
    end

    test "update_company_master/2 with invalid data returns error changeset" do
      company_master = company_master_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_company_master(company_master, @invalid_attrs)
      assert company_master == Company.get_company_master!(company_master.id)
    end

    test "delete_company_master/1 deletes the company_master" do
      company_master = company_master_fixture()
      assert {:ok, %Company_master{}} = Company.delete_company_master(company_master)
      assert_raise Ecto.NoResultsError, fn -> Company.get_company_master!(company_master.id) end
    end

    test "change_company_master/1 returns a company_master changeset" do
      company_master = company_master_fixture()
      assert %Ecto.Changeset{} = Company.change_company_master(company_master)
    end
  end

  describe "company_master" do
    alias PhxApp.Company.Company_master

    @valid_attrs %{company_name: "some company_name", domain_name: "some domain_name", offers: "some offers"}
    @update_attrs %{company_name: "some updated company_name", domain_name: "some updated domain_name", offers: "some updated offers"}
    @invalid_attrs %{company_name: nil, domain_name: nil, offers: nil}

    def company_master_fixture(attrs \\ %{}) do
      {:ok, company_master} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_company_master()

      company_master
    end

    test "list_company_master/0 returns all company_master" do
      company_master = company_master_fixture()
      assert Company.list_company_master() == [company_master]
    end

    test "get_company_master!/1 returns the company_master with given id" do
      company_master = company_master_fixture()
      assert Company.get_company_master!(company_master.id) == company_master
    end

    test "create_company_master/1 with valid data creates a company_master" do
      assert {:ok, %Company_master{} = company_master} = Company.create_company_master(@valid_attrs)
      assert company_master.company_name == "some company_name"
      assert company_master.domain_name == "some domain_name"
      assert company_master.offers == "some offers"
    end

    test "create_company_master/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_company_master(@invalid_attrs)
    end

    test "update_company_master/2 with valid data updates the company_master" do
      company_master = company_master_fixture()
      assert {:ok, company_master} = Company.update_company_master(company_master, @update_attrs)
      assert %Company_master{} = company_master
      assert company_master.company_name == "some updated company_name"
      assert company_master.domain_name == "some updated domain_name"
      assert company_master.offers == "some updated offers"
    end

    test "update_company_master/2 with invalid data returns error changeset" do
      company_master = company_master_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_company_master(company_master, @invalid_attrs)
      assert company_master == Company.get_company_master!(company_master.id)
    end

    test "delete_company_master/1 deletes the company_master" do
      company_master = company_master_fixture()
      assert {:ok, %Company_master{}} = Company.delete_company_master(company_master)
      assert_raise Ecto.NoResultsError, fn -> Company.get_company_master!(company_master.id) end
    end

    test "change_company_master/1 returns a company_master changeset" do
      company_master = company_master_fixture()
      assert %Ecto.Changeset{} = Company.change_company_master(company_master)
    end
  end

  describe "company_requests" do
    alias PhxApp.Company.Company_request

    @valid_attrs %{company_name: "some company_name", domain_name: "some domain_name", email: "some email", is_email_verified: true, transport_type: "some transport_type"}
    @update_attrs %{company_name: "some updated company_name", domain_name: "some updated domain_name", email: "some updated email", is_email_verified: false, transport_type: "some updated transport_type"}
    @invalid_attrs %{company_name: nil, domain_name: nil, email: nil, is_email_verified: nil, transport_type: nil}

    def company_request_fixture(attrs \\ %{}) do
      {:ok, company_request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_company_request()

      company_request
    end

    test "list_company_requests/0 returns all company_requests" do
      company_request = company_request_fixture()
      assert Company.list_company_requests() == [company_request]
    end

    test "get_company_request!/1 returns the company_request with given id" do
      company_request = company_request_fixture()
      assert Company.get_company_request!(company_request.id) == company_request
    end

    test "create_company_request/1 with valid data creates a company_request" do
      assert {:ok, %Company_request{} = company_request} = Company.create_company_request(@valid_attrs)
      assert company_request.company_name == "some company_name"
      assert company_request.domain_name == "some domain_name"
      assert company_request.email == "some email"
      assert company_request.is_email_verified == true
      assert company_request.transport_type == "some transport_type"
    end

    test "create_company_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_company_request(@invalid_attrs)
    end

    test "update_company_request/2 with valid data updates the company_request" do
      company_request = company_request_fixture()
      assert {:ok, company_request} = Company.update_company_request(company_request, @update_attrs)
      assert %Company_request{} = company_request
      assert company_request.company_name == "some updated company_name"
      assert company_request.domain_name == "some updated domain_name"
      assert company_request.email == "some updated email"
      assert company_request.is_email_verified == false
      assert company_request.transport_type == "some updated transport_type"
    end

    test "update_company_request/2 with invalid data returns error changeset" do
      company_request = company_request_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_company_request(company_request, @invalid_attrs)
      assert company_request == Company.get_company_request!(company_request.id)
    end

    test "delete_company_request/1 deletes the company_request" do
      company_request = company_request_fixture()
      assert {:ok, %Company_request{}} = Company.delete_company_request(company_request)
      assert_raise Ecto.NoResultsError, fn -> Company.get_company_request!(company_request.id) end
    end

    test "change_company_request/1 returns a company_request changeset" do
      company_request = company_request_fixture()
      assert %Ecto.Changeset{} = Company.change_company_request(company_request)
    end
  end

  describe "company_users_map" do
    alias PhxApp.Company.CompanyUsersMap

    @valid_attrs %{company_email: "some company_email", designation: "some designation", is_company_email_verified: true}
    @update_attrs %{company_email: "some updated company_email", designation: "some updated designation", is_company_email_verified: false}
    @invalid_attrs %{company_email: nil, designation: nil, is_company_email_verified: nil}

    def company_users_map_fixture(attrs \\ %{}) do
      {:ok, company_users_map} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_company_users_map()

      company_users_map
    end

    test "list_company_users_map/0 returns all company_users_map" do
      company_users_map = company_users_map_fixture()
      assert Company.list_company_users_map() == [company_users_map]
    end

    test "get_company_users_map!/1 returns the company_users_map with given id" do
      company_users_map = company_users_map_fixture()
      assert Company.get_company_users_map!(company_users_map.id) == company_users_map
    end

    test "create_company_users_map/1 with valid data creates a company_users_map" do
      assert {:ok, %CompanyUsersMap{} = company_users_map} = Company.create_company_users_map(@valid_attrs)
      assert company_users_map.company_email == "some company_email"
      assert company_users_map.designation == "some designation"
      assert company_users_map.is_company_email_verified == true
    end

    test "create_company_users_map/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_company_users_map(@invalid_attrs)
    end

    test "update_company_users_map/2 with valid data updates the company_users_map" do
      company_users_map = company_users_map_fixture()
      assert {:ok, company_users_map} = Company.update_company_users_map(company_users_map, @update_attrs)
      assert %CompanyUsersMap{} = company_users_map
      assert company_users_map.company_email == "some updated company_email"
      assert company_users_map.designation == "some updated designation"
      assert company_users_map.is_company_email_verified == false
    end

    test "update_company_users_map/2 with invalid data returns error changeset" do
      company_users_map = company_users_map_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_company_users_map(company_users_map, @invalid_attrs)
      assert company_users_map == Company.get_company_users_map!(company_users_map.id)
    end

    test "delete_company_users_map/1 deletes the company_users_map" do
      company_users_map = company_users_map_fixture()
      assert {:ok, %CompanyUsersMap{}} = Company.delete_company_users_map(company_users_map)
      assert_raise Ecto.NoResultsError, fn -> Company.get_company_users_map!(company_users_map.id) end
    end

    test "change_company_users_map/1 returns a company_users_map changeset" do
      company_users_map = company_users_map_fixture()
      assert %Ecto.Changeset{} = Company.change_company_users_map(company_users_map)
    end
  end
  """
end
