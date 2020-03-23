defmodule MyTweetWeb.Schema.TweetTypes do
  use Absinthe.Schema.Notation
  # see more: https://hexdocs.pm/absinthe/Absinthe.Resolution.Helpers.html
  import Absinthe.Resolution.Helpers, only: [dataloader: 1, dataloader: 3]

  alias MyTwitterWeb.{Data, Resolvers}

  @desc "A tweet with 140 characters"
  object :tweet do
    field :id, :id
    field :text, :string
    field :reply_count, :integer
    field :retweet_count, :integer
    field :favorite_count, :integer
    field :favorited, :boolean
    field :retweeted, :boolean
    field :in_reply_to_status_id, :integer
    field :in_reply_to_user_id, :integer
    field :in_reply_to_screen_name, :string
    field :created_at, :naive_datetime

    field :user, :user, resolve: dataloader(Data)
  end
end
