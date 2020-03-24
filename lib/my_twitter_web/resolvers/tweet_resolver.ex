defmodule MyTwitterWeb.Resolvers.TweetResolver do
  alias MyTwitter.Tweets

  def tweets(_parent, _args, %{context: %{current_user: current_user}}) do
    user_id = current_user.id
    Tweets.list_tweets_by_user(user_id)
  end

  def create_tweet(_, %{object: args}, %{context: %{current_user: current_user}}) do
    tweet_user = Map.merge(args, %{user_id: current_user.id})
    Tweets.create_tweet(tweet_user)
  end
end
