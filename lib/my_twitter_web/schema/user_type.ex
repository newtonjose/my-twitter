defmodule MyTwitterWeb.Schema.UserType do
  use Absinthe.Schema.Notation

  alias MyTwitterWeb.Resolvers

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
    field :email, non_null(:string)
    field :password, non_null(:string)
    field :screen_name, non_null(:string)
    field :created_at, :string
  end

  object :user_queries do
    @desc "Search users by name or screen_name"
    field :users, list_of(:user_type) do
      @desc "Get a list of all users not protected"
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  object :user_mutations do
    @desc "Login a user and return a jwt token"
    field :user_auth, :session_type do
      arg(:object, non_null(:session_input_type))

      resolve(&Resolvers.SessionResolver.user_auth/3)
    end

    @desc "Create a user account"
    field :user_sign_up, :user_type do
      arg(:object, non_null(:user_input_type))

      resolve(&Resolvers.UserResolver.user_sign_up/3)
    end
  end
end
