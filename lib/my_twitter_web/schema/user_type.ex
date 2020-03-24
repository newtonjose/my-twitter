defmodule MyTwitterWeb.Schema.UserType do
  use Absinthe.Schema.Notation

  object :user_type do
    field :id, :id
    field :created_at, :string
    field :description, :string
    field :email, :string
    field :favourites_count
    field :followers_count
    field :location, :string
    field :name, :string
    field :protected, :boolean
    field :screen_name, :string
  end

  input_object :user_input_type do
    field :created_at, non_null(:string)
    field :email, non_null(:string)
    field :name, non_null(:string)
    field :password, non_null(:string)
    field :screen_name, non_null(:string)
  end

  object :user_queries do
    @desc "Search users by name or screen_name"
    field :search_user, list_of(:user_type) do
      arg(:search_term, non_null(:string))

      resolve(&Resolvers.UserResolver.search_users/3)
    end
  end

  object :user_mutations do
    @desc "Authenticate"
    field :auth, :user do
      arg(:screen_name, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.UserResolver.auth/3)
    end

    @desc "Sign up"
    field :sign_up, :user_type do
      arg(:input, non_null(:user_input_type))

      resolve(&Resolvers.UserResolver.signup/3)
    end
  end
end
