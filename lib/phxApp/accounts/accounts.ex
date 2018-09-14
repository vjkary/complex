defmodule PhxApp.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  
 
  alias PhxApp.Repo
#  alias PhxApp.Accounts
  alias PhxApp.Accounts.User 
  alias PhxApp.Accounts.Userdetail
  alias PhxApp.Accounts.UserInterestsNew
  alias PhxApp.Interests.Questions
alias PhxApp.Interests.UserQuestions
alias PhxApp.Accounts.Corporate
alias PhxApp.Libraries.TokenHelper
alias PhxApp.Accounts.UsersTokens
alias PhxApp.Email
alias PhxApp.Mailer

  def ps_create_user_detail(attrs \\ %{}) do

         %User{}
        |> User.changeset(attrs)
        |> Repo.insert()

  end

   def ps_create_user_interest(attrs \\ %{}) do
      user = Repo.get_by(UserInterestsNew, user_id: attrs.user_id)
    IO.inspect user
      case user do

      nil ->
         %UserInterestsNew{}
        |> UserInterestsNew.changeset(attrs)
        |> Repo.insert()
  _ ->
    IO.inspect attrs
        user
        |> UserInterestsNew.changeset(attrs)
        |> Repo.update()
  end
end

def list_users  do
  Repo.all(User)
end

  def ps_list_user_interest(attrs \\ %{}) do
     user = Repo.get_by(UserInterestsNew, user_id: attrs.user_id)
   IO.inspect(user)
    
  end

  def ps_create_user_qstn_mapper(attrs) do
      %UserQuestions{}
        |> UserQuestions.changeset(attrs)
        |> Repo.insert()
  end

      def ps_list_of_users_common_interests(args) do

      q1 = from u in UserInterestsNew, 
       
        where: u.user_id == ^args.user_id1,
        select: u.interest_id

      q2 = from u in UserInterestsNew, 
      
        where: u.user_id == ^args.user_id2,
      select: u.interest_id

    data1 = List.to_string(Repo.all(q1))
    data2 =  List.to_string(Repo.all(q2))
   
    data_list1 = String.split(data1,",")
    data_list2 = String.split(data2,",")
    final_list = MapSet.intersection(MapSet.new(data_list1),MapSet.new(data_list2))


    final_count =MapSet.size(final_list)



  ff= %{:count => final_count}

    IO.inspect ff

   
  end

  def ps_is_answer_valid(args) do
     q1 = from u in UserQuestions, 
       
        where: u.ride_id == ^args.ride_id and u.rider_id == ^args.rider_id  ,
        select: u.rider_optionid

    data1 = List.to_string(Repo.all(q1))

   is_matched = data1==args.driver_option


   ff= %{:is_matched => is_matched}

     IO.inspect ff

  end


  def ps_driver_question_rider(args) do
     q1 = from u in Questions, 
          join: v in UserQuestions, on: u.id == v.question_id ,
         where: v.ride_id == ^args.ride_id and v.rider_id == ^args.rider_id ,
        select: u

      data1 = Repo.all(q1)


  end

#   def ps_list_of_users_common_interests_questions(args) do

#       q1 = from u in UserInterestsNew, 
       
#         where: u.user_id == ^args.driver_id,
#         select: u.interest_id

#       q2 = from u in UserInterestsNew, 
      
#         where: u.user_id == ^args.passenger_id,
#       select: u.interest_id


#     data1 = List.to_string(Repo.all(q1))
#     data2 =  List.to_string(Repo.all(q2))
#     data_list1 = String.split(data1,",")
#     data_list2 = String.split(data2,",")
#     final_list = MapSet.intersection(MapSet.new(data_list1),MapSet.new(data_list2))
#     final_count =MapSet.size(final_list)

#  if final_count >0 do
#     interest_list = MapSet.to_list(final_list)
#     |> Enum.map(&String.to_integer/1)

#      q3= Questions |> where([p], p.interest_id  in ^interest_list) 
    
#         data3=Repo.all(q3)
  
#       |> Enum.group_by(&Map.take(&1, [:id]), &Map.take(&1, [:category_id, :id, :question, :option1, :option2, :option3, :option4, :interest_id]))
#       |> Enum.map( fn{k, v} -> Map.put(k, :questions, v) end)
  
# else
#   interest_list = data_list2
#     |> Enum.map(&String.to_integer/1)

#       data3 = Repo.all(Questions)
#       |> Enum.group_by(&Map.take(&1, [:id]), &Map.take(&1, [:category_id, :id, :question, :option1, :option2, :option3, :option4, :interest_id]))
#       |> Enum.map( fn{k, v} -> Map.put(k, :questions, v) end)
#   end

#      list_nteger = data3
#              |> Enum.group_by(&Map.take(&1, [:id]), &Map.drop(&1, [:questions]))
#              |> Map.keys

#        int_list= Enum.map(list_nteger, fn (x) -> x[:id] end)
#           # IO.inspect int_list

#   q4= UserQuestions |> where([p], p.question_id in ^int_list and p.driver_id == ^args.driver_id and p.rider_id == ^args.passenger_id) 
#   user_question_mapper = Repo.all(q4)
  
#    cond  do
  
#      length(user_question_mapper) == 0 ||  length(user_question_mapper) >20 ->
#        rawdata = Enum.to_list(data3)
#        questions = Enum.take_random(rawdata,1)
    
  
#    length(user_question_mapper) >0 &&  length(user_question_mapper) <=20  ->
 
#           q4= from u in UserQuestions, 
      
#         where: u.driver_id == ^args.driver_id and u.rider_id == ^args.passenger_id,
#       select: u.question_id
        
#          user_questions_qstion_id=Repo.all(q4)
#            q5= Questions |> where([p], p.interest_id  in ^interest_list and p.id not in ^user_questions_qstion_id )     
  
#         data5=Repo.all(q5)
#          |> Enum.group_by(&Map.take(&1, [:id]), &Map.take(&1, [:category_id, :id, :question, :option1, :option2, :option3, :option4, :interest_id]))
#         |> Enum.map( fn{k, v} -> Map.put(k, :questions, v) end)

#        rawdata = Enum.to_list(data5)

  

#        questions = Enum.take_random(rawdata,1)
     
#    end
# questions
   
#   end




    defp result_to_struct(res) do
    cols = Enum.map res.columns, &(String.to_atom(&1))
    Enum.map res.rows, fn(row) -> struct(__MODULE__, Enum.zip(cols, row)) end
  end

  def ps_update_user_detail_city(user_id,token) do
       
    user_token_data =  Repo.get_by(UsersTokens,user_id: user_id, token: token)
     IO.inspect user_token_data
  if user_token_data != nil  do
    token_matched = user_token_data.token==token
     IO.inspect token_matched
    
    if token_matched = true  do
      users_details = Repo.get_by(Userdetail,user_id: user_id)
    users_details = Ecto.Changeset.change users_details, [city: token]
    case Repo.update users_details do
      {:ok, struct}  ->  {:ok, struct}
      {:error, changeset}  ->  {:error, changeset}
    end
    Repo.delete(user_token_data)
    
    end
  end

  
  end
   



  def ps_update_user_detail(%{id: id,  post: post_params}) do
    data = Repo.get_by(User,id: id)
    IO.inspect(data)

     case data do
      nil ->
        {:error, "Data does not exist"}

      data ->
        data
        |> User.changeset(post_params)
        |> Repo.update()
    
  end
   
  end

    def ps_list_all_users(arg) do
       user_id = arg.id
     Repo.get(User, user_id)

  end



    def ps_create_detail_user(attrs \\ %{}) do

       confirm_id = random_string(10)
       attrs1 = %{:user_id => attrs.user_id, :token => confirm_id}
      IO.inspect attrs1
       %UsersTokens{}
        |> UsersTokens.changeset(attrs1)
        |> Repo.insert()
      #UsersTokens 
     # IO.inspect  TokenHelper.activation_url(PhxApp.Endpoint, :confirm, confirm_id: confirm_id)
    body ="<p>Thanks for signing up with Hoovi! :)</p>
            <p>Please click the link below to verify your email address</p>
            <a href=http://0.0.0.0:4000/verify/#{attrs.user_id}/#{confirm_id}>Verify Your Email address</a>"
    subject = "Hoovi Email Verification Required"
    Email.welcome_text_email(attrs.email,body,subject) |> Mailer.deliver_later
         %Userdetail{}
        |> Userdetail.changeset(attrs)
        |> Repo.insert()
    
  end

 
def random_string(length) do
  :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
end


  def ps_create_company(args) do
     
     data = Repo.get_by(Corporate,company_domain: args.company_domain)
  IO.inspect data
     case  data do
        nil->
           %Corporate{}
           |> Corporate.changeset(args)
           |> Repo.insert()
         _ ->
             IO.inspect "Company request already sent for approval"
     end
        

  end

  def ps_create_email_token(args) do
    
  end


  
  alias PhxApp.Accounts.UsersTokens

  @doc """
  Returns the list of users_tokens.

  ## Examples

      iex> list_users_tokens()
      [%UsersTokens{}, ...]

  """
  def list_users_tokens do
    Repo.all(UsersTokens)
  end

  @doc """
  Gets a single users_tokens.

  Raises `Ecto.NoResultsError` if the Users tokens does not exist.

  ## Examples

      iex> get_users_tokens!(123)
      %UsersTokens{}

      iex> get_users_tokens!(456)
      ** (Ecto.NoResultsError)

  """
  def get_users_tokens!(id), do: Repo.get!(UsersTokens, id)

  @doc """
  Creates a users_tokens.

  ## Examples

      iex> create_users_tokens(%{field: value})
      {:ok, %UsersTokens{}}

      iex> create_users_tokens(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_users_tokens(attrs \\ %{}) do
    %UsersTokens{}
    |> UsersTokens.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a users_tokens.

  ## Examples

      iex> update_users_tokens(users_tokens, %{field: new_value})
      {:ok, %UsersTokens{}}

      iex> update_users_tokens(users_tokens, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_users_tokens(%UsersTokens{} = users_tokens, attrs) do
    users_tokens
    |> UsersTokens.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UsersTokens.

  ## Examples

      iex> delete_users_tokens(users_tokens)
      {:ok, %UsersTokens{}}

      iex> delete_users_tokens(users_tokens)
      {:error, %Ecto.Changeset{}}

  """
  def delete_users_tokens(%UsersTokens{} = users_tokens) do
    Repo.delete(users_tokens)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking users_tokens changes.

  ## Examples

      iex> change_users_tokens(users_tokens)
      %Ecto.Changeset{source: %UsersTokens{}}

  """
  def change_users_tokens(%UsersTokens{} = users_tokens) do
    UsersTokens.changeset(users_tokens, %{})
  end
end
