defmodule PhxApp.Interests do
  @moduledoc """
  The Interests context.
  """

  import Ecto.Query, warn: false
  alias PhxApp.Repo

  alias PhxApp.Interests.Category
 alias PhxApp.Interests.Category_Master
alias PhxApp.Interests.Questions
alias PhxApp.Interests.UserQuestions
  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
def ps_create_category(attrs \\ %{}) do

         %Category{}
        |> Category.changeset(attrs)
        |> Repo.insert()

  end

  def ps_create_category_master(attrs \\ %{}) do

         %Category_Master{}
        |> Category_Master.changeset(attrs)
        |> Repo.insert()

  end



  def list_categories do
    Repo.all(Category)
  end

  def list_category_master_group do
    q = from c in Category_Master,
         join: d in Category , on: d.id == c.category_id 
    Repo.all(q)
      |> Enum.group_by(&Map.take(&1, [:category_id]), &Map.take(&1, [:category_id, :id, :interest_name]))
      |> Enum.map( fn{k, v} -> Map.put(k, :categories, v) end)
      |> IO.inspect


  end

  def list_categories_interest_master do
    Repo.all(Category_Master)
  end

  def list_category_master_id(arg) do
    id = arg.id
    Repo.get(Category_Master, id)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end

  alias PhxApp.Interests.Category_Master

  @doc """
  Returns the list of categories_master.

  ## Examples

      iex> list_categories_master()
      [%Category_Master{}, ...]

  """
  def list_categories_master do
    Repo.all(Category_Master)
  end

  @doc """
  Gets a single category__master.

  Raises `Ecto.NoResultsError` if the Category  master does not exist.

  ## Examples

      iex> get_category__master!(123)
      %Category_Master{}

      iex> get_category__master!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category__master!(id), do: Repo.get!(Category_Master, id)

  @doc """
  Creates a category__master.

  ## Examples

      iex> create_category__master(%{field: value})
      {:ok, %Category_Master{}}

      iex> create_category__master(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category__master(attrs \\ %{}) do
    %Category_Master{}
    |> Category_Master.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category__master.

  ## Examples

      iex> update_category__master(category__master, %{field: new_value})
      {:ok, %Category_Master{}}

      iex> update_category__master(category__master, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category__master(%Category_Master{} = category__master, attrs) do
    category__master
    |> Category_Master.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category_Master.

  ## Examples

      iex> delete_category__master(category__master)
      {:ok, %Category_Master{}}

      iex> delete_category__master(category__master)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category__master(%Category_Master{} = category__master) do
    Repo.delete(category__master)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category__master changes.

  ## Examples

      iex> change_category__master(category__master)
      %Ecto.Changeset{source: %Category_Master{}}

  """
  def change_category__master(%Category_Master{} = category__master) do
    Category_Master.changeset(category__master, %{})
  end

  alias PhxApp.Interests.Cust_Interests

  @doc """
  Returns the list of cust_user_interests.

  ## Examples

      iex> list_cust_user_interests()
      [%Cust_Interests{}, ...]

  """
  def list_cust_user_interests do
    Repo.all(Cust_Interests)
  end

  @doc """
  Gets a single cust__interests.

  Raises `Ecto.NoResultsError` if the Cust  interests does not exist.

  ## Examples

      iex> get_cust__interests!(123)
      %Cust_Interests{}

      iex> get_cust__interests!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cust__interests!(id), do: Repo.get!(Cust_Interests, id)

  @doc """
  Creates a cust__interests.

  ## Examples

      iex> create_cust__interests(%{field: value})
      {:ok, %Cust_Interests{}}

      iex> create_cust__interests(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cust__interests(attrs \\ %{}) do
    %Cust_Interests{}
    |> Cust_Interests.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cust__interests.

  ## Examples

      iex> update_cust__interests(cust__interests, %{field: new_value})
      {:ok, %Cust_Interests{}}

      iex> update_cust__interests(cust__interests, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cust__interests(%Cust_Interests{} = cust__interests, attrs) do
    cust__interests
    |> Cust_Interests.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cust_Interests.

  ## Examples

      iex> delete_cust__interests(cust__interests)
      {:ok, %Cust_Interests{}}

      iex> delete_cust__interests(cust__interests)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cust__interests(%Cust_Interests{} = cust__interests) do
    Repo.delete(cust__interests)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cust__interests changes.

  ## Examples

      iex> change_cust__interests(cust__interests)
      %Ecto.Changeset{source: %Cust_Interests{}}

  """
  def change_cust__interests(%Cust_Interests{} = cust__interests) do
    Cust_Interests.changeset(cust__interests, %{})
  end

  alias PhxApp.Interests.Questions

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Questions{}, ...]

  """
  def list_questions do
    Repo.all(Questions)
  end

  @doc """
  Gets a single questions.

  Raises `Ecto.NoResultsError` if the Questions does not exist.

  ## Examples

      iex> get_questions!(123)
      %Questions{}

      iex> get_questions!(456)
      ** (Ecto.NoResultsError)

  """
  def get_questions!(id), do: Repo.get!(Questions, id)

  @doc """
  Creates a questions.

  ## Examples

      iex> create_questions(%{field: value})
      {:ok, %Questions{}}

      iex> create_questions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_questions(attrs \\ %{}) do
    %Questions{}
    |> Questions.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a questions.

  ## Examples

      iex> update_questions(questions, %{field: new_value})
      {:ok, %Questions{}}

      iex> update_questions(questions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_questions(%Questions{} = questions, attrs) do
    questions
    |> Questions.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Questions.

  ## Examples

      iex> delete_questions(questions)
      {:ok, %Questions{}}

      iex> delete_questions(questions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_questions(%Questions{} = questions) do
    Repo.delete(questions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking questions changes.

  ## Examples

      iex> change_questions(questions)
      %Ecto.Changeset{source: %Questions{}}

  """
  def change_questions(%Questions{} = questions) do
    Questions.changeset(questions, %{})
  end

  alias PhxApp.Interests.UserQuestions

  @doc """
  Returns the list of user_questions_mapper.

  ## Examples

      iex> list_user_questions_mapper()
      [%UserQuestions{}, ...]

  """
  def list_user_questions_mapper do
    Repo.all(UserQuestions)
  end

  @doc """
  Gets a single user_questions.

  Raises `Ecto.NoResultsError` if the User questions does not exist.

  ## Examples

      iex> get_user_questions!(123)
      %UserQuestions{}

      iex> get_user_questions!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_questions!(id), do: Repo.get!(UserQuestions, id)

  @doc """
  Creates a user_questions.

  ## Examples

      iex> create_user_questions(%{field: value})
      {:ok, %UserQuestions{}}

      iex> create_user_questions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_questions(attrs \\ %{}) do
    %UserQuestions{}
    |> UserQuestions.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_questions.

  ## Examples

      iex> update_user_questions(user_questions, %{field: new_value})
      {:ok, %UserQuestions{}}

      iex> update_user_questions(user_questions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_questions(%UserQuestions{} = user_questions, attrs) do
    user_questions
    |> UserQuestions.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserQuestions.

  ## Examples

      iex> delete_user_questions(user_questions)
      {:ok, %UserQuestions{}}

      iex> delete_user_questions(user_questions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_questions(%UserQuestions{} = user_questions) do
    Repo.delete(user_questions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_questions changes.

  ## Examples

      iex> change_user_questions(user_questions)
      %Ecto.Changeset{source: %UserQuestions{}}

  """
  def change_user_questions(%UserQuestions{} = user_questions) do
    UserQuestions.changeset(user_questions, %{})
  end
end
