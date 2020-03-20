defmodule Socializer.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Socializer.{ Tweets }

  schema "users" do
    field :created_at, :string
    field :description, :string
    field :favourites_count, :integer
    field :followers_count, :integer
    field :location, :string
    field :name, :string
    field :protected, :boolean, default: false
    field :screen_name, :string
    field :url, :string

    has_many :tweets, Tweets

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
        :name, :screen_name, :location, :url, :description, :protected,
        :followers_count, :favourites_count, :created_at
      ])
    |> validate_required([
        :name, :screen_name, :location, :url, :description, :protected,
        :followers_count, :favourites_count, :created_at
      ])
  end
end
