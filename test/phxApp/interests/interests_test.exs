defmodule PhxApp.InterestsTest do
  use PhxApp.DataCase

  alias PhxApp.Interests

 @moduledoc """
  The Accounts context.
  describe "categories" do
    alias PhxApp.Interests.Category

    @valid_attrs %{categoryId: 42, categoryName: "some categoryName"}
    @update_attrs %{categoryId: 43, categoryName: "some updated categoryName"}
    @invalid_attrs %{categoryId: nil, categoryName: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interests.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Interests.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Interests.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Interests.create_category(@valid_attrs)
      assert category.categoryId == 42
      assert category.categoryName == "some categoryName"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interests.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Interests.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.categoryId == 43
      assert category.categoryName == "some updated categoryName"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Interests.update_category(category, @invalid_attrs)
      assert category == Interests.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Interests.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Interests.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Interests.change_category(category)
    end
  end

  describe "categories_master" do
    alias PhxApp.Interests.Category_Master

    @valid_attrs %{categoryId: 42, interestName: "some interestName"}
    @update_attrs %{categoryId: 43, interestName: "some updated interestName"}
    @invalid_attrs %{categoryId: nil, interestName: nil}

    def category__master_fixture(attrs \\ %{}) do
      {:ok, category__master} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interests.create_category__master()

      category__master
    end

    test "list_categories_master/0 returns all categories_master" do
      category__master = category__master_fixture()
      assert Interests.list_categories_master() == [category__master]
    end

    test "get_category__master!/1 returns the category__master with given id" do
      category__master = category__master_fixture()
      assert Interests.get_category__master!(category__master.id) == category__master
    end

    test "create_category__master/1 with valid data creates a category__master" do
      assert {:ok, %Category_Master{} = category__master} = Interests.create_category__master(@valid_attrs)
      assert category__master.categoryId == 42
      assert category__master.interestName == "some interestName"
    end

    test "create_category__master/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interests.create_category__master(@invalid_attrs)
    end

    test "update_category__master/2 with valid data updates the category__master" do
      category__master = category__master_fixture()
      assert {:ok, category__master} = Interests.update_category__master(category__master, @update_attrs)
      assert %Category_Master{} = category__master
      assert category__master.categoryId == 43
      assert category__master.interestName == "some updated interestName"
    end

    test "update_category__master/2 with invalid data returns error changeset" do
      category__master = category__master_fixture()
      assert {:error, %Ecto.Changeset{}} = Interests.update_category__master(category__master, @invalid_attrs)
      assert category__master == Interests.get_category__master!(category__master.id)
    end

    test "delete_category__master/1 deletes the category__master" do
      category__master = category__master_fixture()
      assert {:ok, %Category_Master{}} = Interests.delete_category__master(category__master)
      assert_raise Ecto.NoResultsError, fn -> Interests.get_category__master!(category__master.id) end
    end

    test "change_category__master/1 returns a category__master changeset" do
      category__master = category__master_fixture()
      assert %Ecto.Changeset{} = Interests.change_category__master(category__master)
    end
  end

  describe "cust_user_interests" do
    alias PhxApp.Interests.Cust_Interests

    @valid_attrs %{interest_names: "some interest_names"}
    @update_attrs %{interest_names: "some updated interest_names"}
    @invalid_attrs %{interest_names: nil}

    def cust__interests_fixture(attrs \\ %{}) do
      {:ok, cust__interests} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interests.create_cust__interests()

      cust__interests
    end

    test "list_cust_user_interests/0 returns all cust_user_interests" do
      cust__interests = cust__interests_fixture()
      assert Interests.list_cust_user_interests() == [cust__interests]
    end

    test "get_cust__interests!/1 returns the cust__interests with given id" do
      cust__interests = cust__interests_fixture()
      assert Interests.get_cust__interests!(cust__interests.id) == cust__interests
    end

    test "create_cust__interests/1 with valid data creates a cust__interests" do
      assert {:ok, %Cust_Interests{} = cust__interests} = Interests.create_cust__interests(@valid_attrs)
      assert cust__interests.interest_names == "some interest_names"
    end

    test "create_cust__interests/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interests.create_cust__interests(@invalid_attrs)
    end

    test "update_cust__interests/2 with valid data updates the cust__interests" do
      cust__interests = cust__interests_fixture()
      assert {:ok, cust__interests} = Interests.update_cust__interests(cust__interests, @update_attrs)
      assert %Cust_Interests{} = cust__interests
      assert cust__interests.interest_names == "some updated interest_names"
    end

    test "update_cust__interests/2 with invalid data returns error changeset" do
      cust__interests = cust__interests_fixture()
      assert {:error, %Ecto.Changeset{}} = Interests.update_cust__interests(cust__interests, @invalid_attrs)
      assert cust__interests == Interests.get_cust__interests!(cust__interests.id)
    end

    test "delete_cust__interests/1 deletes the cust__interests" do
      cust__interests = cust__interests_fixture()
      assert {:ok, %Cust_Interests{}} = Interests.delete_cust__interests(cust__interests)
      assert_raise Ecto.NoResultsError, fn -> Interests.get_cust__interests!(cust__interests.id) end
    end

    test "change_cust__interests/1 returns a cust__interests changeset" do
      cust__interests = cust__interests_fixture()
      assert %Ecto.Changeset{} = Interests.change_cust__interests(cust__interests)
    end
  end

  describe "questions" do
    alias PhxApp.Interests.Questions

    @valid_attrs %{option1: "some option1", option2: "some option2", option3: "some option3", option4: "some option4", question: "some question"}
    @update_attrs %{option1: "some updated option1", option2: "some updated option2", option3: "some updated option3", option4: "some updated option4", question: "some updated question"}
    @invalid_attrs %{option1: nil, option2: nil, option3: nil, option4: nil, question: nil}

    def questions_fixture(attrs \\ %{}) do
      {:ok, questions} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interests.create_questions()

      questions
    end

    test "list_questions/0 returns all questions" do
      questions = questions_fixture()
      assert Interests.list_questions() == [questions]
    end

    test "get_questions!/1 returns the questions with given id" do
      questions = questions_fixture()
      assert Interests.get_questions!(questions.id) == questions
    end

    test "create_questions/1 with valid data creates a questions" do
      assert {:ok, %Questions{} = questions} = Interests.create_questions(@valid_attrs)
      assert questions.option1 == "some option1"
      assert questions.option2 == "some option2"
      assert questions.option3 == "some option3"
      assert questions.option4 == "some option4"
      assert questions.question == "some question"
    end

    test "create_questions/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interests.create_questions(@invalid_attrs)
    end

    test "update_questions/2 with valid data updates the questions" do
      questions = questions_fixture()
      assert {:ok, questions} = Interests.update_questions(questions, @update_attrs)
      assert %Questions{} = questions
      assert questions.option1 == "some updated option1"
      assert questions.option2 == "some updated option2"
      assert questions.option3 == "some updated option3"
      assert questions.option4 == "some updated option4"
      assert questions.question == "some updated question"
    end

    test "update_questions/2 with invalid data returns error changeset" do
      questions = questions_fixture()
      assert {:error, %Ecto.Changeset{}} = Interests.update_questions(questions, @invalid_attrs)
      assert questions == Interests.get_questions!(questions.id)
    end

    test "delete_questions/1 deletes the questions" do
      questions = questions_fixture()
      assert {:ok, %Questions{}} = Interests.delete_questions(questions)
      assert_raise Ecto.NoResultsError, fn -> Interests.get_questions!(questions.id) end
    end

    test "change_questions/1 returns a questions changeset" do
      questions = questions_fixture()
      assert %Ecto.Changeset{} = Interests.change_questions(questions)
    end
  end

  describe "user_questions_mapper" do
    alias PhxApp.Interests.UserQuestions

    @valid_attrs %{is_matcher: true, rider_option: "some rider_option"}
    @update_attrs %{is_matcher: false, rider_option: "some updated rider_option"}
    @invalid_attrs %{is_matcher: nil, rider_option: nil}

    def user_questions_fixture(attrs \\ %{}) do
      {:ok, user_questions} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interests.create_user_questions()

      user_questions
    end

    test "list_user_questions_mapper/0 returns all user_questions_mapper" do
      user_questions = user_questions_fixture()
      assert Interests.list_user_questions_mapper() == [user_questions]
    end

    test "get_user_questions!/1 returns the user_questions with given id" do
      user_questions = user_questions_fixture()
      assert Interests.get_user_questions!(user_questions.id) == user_questions
    end

    test "create_user_questions/1 with valid data creates a user_questions" do
      assert {:ok, %UserQuestions{} = user_questions} = Interests.create_user_questions(@valid_attrs)
      assert user_questions.is_matcher == true
      assert user_questions.rider_option == "some rider_option"
    end

    test "create_user_questions/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interests.create_user_questions(@invalid_attrs)
    end

    test "update_user_questions/2 with valid data updates the user_questions" do
      user_questions = user_questions_fixture()
      assert {:ok, user_questions} = Interests.update_user_questions(user_questions, @update_attrs)
      assert %UserQuestions{} = user_questions
      assert user_questions.is_matcher == false
      assert user_questions.rider_option == "some updated rider_option"
    end

    test "update_user_questions/2 with invalid data returns error changeset" do
      user_questions = user_questions_fixture()
      assert {:error, %Ecto.Changeset{}} = Interests.update_user_questions(user_questions, @invalid_attrs)
      assert user_questions == Interests.get_user_questions!(user_questions.id)
    end

    test "delete_user_questions/1 deletes the user_questions" do
      user_questions = user_questions_fixture()
      assert {:ok, %UserQuestions{}} = Interests.delete_user_questions(user_questions)
      assert_raise Ecto.NoResultsError, fn -> Interests.get_user_questions!(user_questions.id) end
    end

    test "change_user_questions/1 returns a user_questions changeset" do
      user_questions = user_questions_fixture()
      assert %Ecto.Changeset{} = Interests.change_user_questions(user_questions)
    end
  end
  """
end
