
defmodule PhxAppWeb.GraphiQL.Schema do
	  use Absinthe.Schema

	  alias PhxAppWeb.GraphiQL.Resolvers.UserResolver
	 alias PhxAppWeb.GraphiQL.Resolvers.InterestResolver
	 alias PhxAppWeb.GraphiQL.Resolvers.CompanyResolver

	   import_types PhxAppWeb.GraphiQL.Types.UserTypes
       import_types PhxAppWeb.GraphiQL.Types.InterestTypes
       import_types PhxAppWeb.GraphiQL.Types.CompanyTypes

	    import_types Absinthe.Plug.Types


        query do
        field :list_all_users, list_of(:user_details) do
        arg :id, non_null(:id)
     	resolve &UserResolver.ct_list_all_users/3
    	end
   
   	   field :list_all, list_of(:user_details) do
     	resolve &UserResolver.ct_list_all/3
    	end
 		
 		field :list_all_category, list_of(:category_list) do
     	resolve &InterestResolver.ct_list_all_interest/3
    	end

    	field :get_common_interests, list_of(:user_interest_lists) do
	   	 	arg :user_id1, :integer
	   	 	arg :user_id2, :integer
	   	 	resolve &UserResolver.ct_list_common_interests/3
	   	 end

	   	   	field :get_user_interest, list_of(:user_interest_list) do
	   	 	arg :user_id, :id
	   	 	resolve &UserResolver.ct_list_of_users_interests/3
	   	 end

	   	 field :get_interest_master, list_of(:category_master_data) do
	   	 	resolve &InterestResolver.ct_list_all_category_master/3
	   	 end

	   	 	 field :get_interest_master_id_based, list_of(:category_interest_master_list) do
	   	 	 	arg :id,non_null(:id)
	   	 	resolve &InterestResolver.ct_list_category_master_id_based/3
	   	 end

	   	 field :get_common_interests_questions, list_of(:user_interest_lists__question) do
	   	 	arg :driver_id, :integer
	   	 	arg :passenger_id, :integer
	   	 	resolve &UserResolver.ct_list_common_interests_questions/3
	   	 end

	   	 field :validate_interest_otp , list_of(:interst_answer_match) do
	   	 	arg :ride_id, :integer
	   	 	arg :rider_id, :integer
	   	 	arg :driver_option, :string
	   	 	resolve &UserResolver.ct_is_answer_matched/3
	   	 end

	   	 field :send_rider_question_to_driver, list_of(:questions_options) do
			arg :ride_id, :integer
	   	 	arg :rider_id, :integer
	   	 	resolve &UserResolver.ct_driver_rider_question/3
	   	 	
	   	 end

	   	 field :list_company_master, list_of(:company_master_details) do
	   	 	 resolve & CompanyResolver.ct_list_all_company/3
	   	 end

        end



	   	 mutation do
	   	 	
	   	 	  field :create_user_detail, list_of(:user_details) do
	   	 	  	arg :name,  non_null(:string)
	   	 	  	arg :passwd, non_null(:string)
	   	 	  	arg :age, non_null(:integer)

	   	 	  	resolve &UserResolver.ct_create_user_detail/3

	   	 	  end

            field :update_name, list_of(:user_details) do
            	arg :post,     :params_update_user
            	arg :id, non_null(:integer)

            	resolve &UserResolver.ct_update_user_detail/3
            end

             field :create_detail_user, list_of(:detail_users) do
             	arg :user_id, non_null(:id)
	   	 	  	arg :city,  non_null(:string)
	   	 	  	arg :email, non_null(:string)

	   	 	  	resolve &UserResolver.ct_detail_user/3

	   	 	  end

	   	 	  field :create_category, list_of(:category_list) do
	   	 	  	arg :category_name, non_null(:string)

	   	 	  	resolve &InterestResolver.ct_category/3
	   	 	  end


	   	 	    field :create_category_master, list_of(:category_master_list) do
             	arg :category_id, non_null(:integer)
	   	 	  	arg :interest_name,  non_null(:string)
	   	 	  	resolve &InterestResolver.ct_category_master/3

	   	 	  end

	   	 	   field :create_user_interest, list_of(:user_interest_list) do
             	arg :user_id, non_null(:id)
	   	 	  	arg :interest_id,  non_null(:string)
	   	 	  	arg :interest_name,  non_null(:string)
	   	 	  	resolve &UserResolver.ct_create_user_interest/3

	   	 	  end
                
               field :create_user_question_mapper, list_of(:user_question_mapper) do
               	arg :driver_id, non_null(:integer)
               	arg :rider_id, non_null(:integer)
               	arg :ride_id, non_null(:integer)
               	arg :question_id, non_null(:integer)
               	arg :rider_option, non_null(:string)
               	resolve &UserResolver.ct_user_qstn_mapper/3
               end 

               field :create_company_record, list_of(:company_details)do
               	arg :company_name, non_null(:string)
               	arg :company_domain, non_null(:string)
               	resolve &UserResolver.ct_create_company/3
               end

               field :update_user_detail_city, list_of(:city) do
              	arg :post,     :param_boolean_verify
            	arg :user_id, non_null(:integer)

            	resolve &UserResolver.ct_update_user_detail_city/3

               end

               field :create_company_request, list_of(:company_requests) do
               arg :company_name, non_null(:string)
               # arg :domain_name, non_null(:string)
               arg :email, non_null(:string)
               arg :user_id, non_null(:integer)
               arg :transport_type, non_null(:string)
               arg :designation , :string
                resolve & CompanyResolver.ct_company_request/3
             end 

             field :create_corporate_enrollment, list_of(:corporate_user) do
             	arg :company_id, non_null(:integer)
             	arg :user_id, non_null(:integer)
             	arg :designation , :string
             	arg :company_email, non_null(:string)

             	resolve & CompanyResolver.ct_company_user_enroller/3
             end

	   end
	end
