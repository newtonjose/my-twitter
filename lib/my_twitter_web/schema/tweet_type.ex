defmodule MyTwitterWeb.Schema.TweetType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: MyTwitter.Repo

  alias MyTwitterWeb.Resolvers
  alias MyTwitterWeb.Schema.Middleware

  object :tweet_type do
    field :id, :id
    field :created_at, :string
    field :favorite_count, :integer
    field :favorited, :boolean
    field :in_reply_to_screen_name, :string
    field :in_reply_to_status_id, :integer
    field :in_reply_to_user_id, :integer
    field :reply_count, :integer
    field :retweet_count, :integer
    field :retweeted, :boolean
    field :text, :string

    field :user, :user_type, resolve: assoc(:user)
  end

  input_object :tweet_input_type do
    field :text, non_null(:string)
    field :created_at, :string
  end

  object :tweet_queries do
    @desc "Search tweets by name or screen_name"
    field :tweets, list_of(:tweet_type) do
      @desc "Get a list of all tweets not protected"
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.TweetResolver.tweets/3)
    end
  end

  object :tweet_mutations do
    @desc "Crete a tweet with 140 character"
    field :create_tweet, :tweet_type do
      arg(:object, non_null(:tweet_input_type))

      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.TweetResolver.create_tweet/3)
    end
  end
end
