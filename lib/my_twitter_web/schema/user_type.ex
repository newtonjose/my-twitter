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
    field :password, :string
    field :protected, :boolean
    field :screen_name, :string
  end

  input_object :user_input_type do
    field :created_at, non_null(:string)
    field :email, non_null(:string)
    field :name, non_null(:string)
    field :screen_name, non_null(:string)
  end
end
