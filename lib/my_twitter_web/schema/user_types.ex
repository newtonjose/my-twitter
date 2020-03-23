defmodule MyTwitterWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias MyTwitterWeb.{Data, Resolvers}

  @desc "A user of the site"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :screen_name, :string
    field :description, :string
    field :location, :string
    field :protected, :boolean, default_value: false
    field :url, :string
    field :followers_count, :integer
    field :favourites_count, :integer
    field :created_at, :naive_datetime
    field :token, :string

    field :gravatar_md5, :string do
      resolve(fn user, _, _ ->
        {:ok, :crypto.hash(:md5, user.email) |> Base.encode16(case: :lower)}
      end)
    end

    field :tweets, list_of(:tweet), resolve: dataloader(Data)
  end

  object :user_queries do
    @desc "Search users"
    field :search_users, list_of(:user) do
      arg(:search_term, non_null(:string))

      resolve(&Resolvers.UserResolver.search_users/3)
    end

    @desc "Get current user"
    field :current_user, :user do
      resolve(&Resolvers.UserResolver.current_user/3)
    end
  end

  object :user_mutations do
    @desc "Authenticate"
    field :authenticate, :user do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.UserResolver.authenticate/3)
    end

    @desc "Sign up"
    field :sign_up, :user do
      arg(:screen_name, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.UserResolver.signup/3)
    end
  end
end
