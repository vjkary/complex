defmodule PhxAppWeb.GraphiQL.Resolvers.UserResolver do

	alias PhxApp.Accounts
#	alias  PhxAppWeb.GraphiQL.Resolvers.UserResolver


	 def ct_create_user_detail(_root, args, _info) do
    case Accounts.ps_create_user_detail(args) do
      {:ok, user_details} ->
        {:ok, user_details}

      _error ->
        {:error, _error}
    end
  end

def ct_create_user_interest(_root, args, _info) do
   IO.inspect args

    case Accounts.ps_create_user_interest(args) do
      {:ok, user_interest} ->
        {:ok, user_interest}

      _error ->
        {:error, _error}
    end
  end

  def ct_update_user_detail(_root, args, _info) do
    case Accounts.ps_update_user_detail(args) do
      {:ok, user_details} ->
        {:ok, user_details}

      _error ->
        {:error, _error}
    end
  end

 def ct_update_user_detail_city(_root, args, _info) do
  IO.inspect args
    case Accounts.ps_update_user_detail_city(args) do
      {:ok, user_details} ->
        {:ok, user_details}

      _error ->
        {:error, _error}
    end
  end

  def ct_list_all_users(_root, args, _info) do
    {:ok, Accounts.ps_list_all_users(args) }
  end

    def ct_list_all(_root, args, _info) do
    {:ok, Accounts.list_users() }
  end

   def ct_detail_user(_root, args, _info) do
    case Accounts.ps_create_detail_user(args) do
      {:ok, user_details} ->
        {:ok, user_details}

      _error ->
        {:error, _error}
    end
  end

  def ct_create_company(_root, args, _info) do
    IO.inspect args
    case Accounts.ps_create_company(args) do
      {:ok, corporate} ->
        {:ok, corporate}

      _error ->
        {:error, _error}
    end
  end



    def ct_list_common_interests(_root,args,_info)do
       IO.inspect args
        {:ok, Accounts.ps_list_of_users_common_interests(args)}
    end

     def ct_list_common_interests_questions(_root,args,_info)do
       IO.inspect args
        {:ok, Accounts.ps_list_of_users_common_interests_questions(args)}
    end

    def ct_is_answer_matched(_root,args,_info)do
       IO.inspect args
        {:ok, Accounts.ps_is_answer_valid(args)}
    end

      def ct_driver_rider_question(_root,args,_info)do
     
        {:ok, Accounts.ps_driver_question_rider(args)}
    end
    


     def ct_list_of_users_interests(_root,args,_info)do
       IO.inspect args 
      {:ok, Accounts.ps_list_user_interest(args)}
          end

    def ct_user_qstn_mapper(_root, args, _info) do
      case Accounts.ps_create_user_qstn_mapper(args) do
      {:ok, user_question_mapper} ->
        {:ok, user_question_mapper}

      _error ->
        {:error, _error}
    end
  end

end