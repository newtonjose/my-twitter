defmodule MyTwitterWeb.Resolvers.TweetResolver do
  alias MyTwitter.Tweet

  def list_tweets(_parent, _args, %{context: %{current_user: _}}) do
    {:ok, Tweet.list_tweets()}
  end

  def list_tweets(_parent, _args, _resolutions) do
    {:error, "Unauthenticated"}
  end

  def get_tweet(_parent, args, %{context: %{current_user: _}}) do
    case Tweet.find(args[:id]) do
      nil -> {:error, "Tweet not found"}
      tweet -> {:ok, tweet}
    end
  end

  def get_tweet(_parent, _args, _resolutions) do
    {:error, "Unauthenticated"}
  end
end
