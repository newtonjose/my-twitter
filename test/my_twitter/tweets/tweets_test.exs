defmodule MyTwitter.TweetsTest do
  use MyTwitter.DataCase

  alias MyTwitter.Tweets

  describe "tweets" do
    alias MyTwitter.Tweets.Tweet

    @valid_attrs %{created_at: "some created_at", favorite_count: 42, favorited: true, in_reply_to_screen_name: "some in_reply_to_screen_name", in_reply_to_status_id: 42, in_reply_to_user_id: 42, reply_count: 42, retweet_count: 42, retweeted: true, text: "some text"}
    @update_attrs %{created_at: "some updated created_at", favorite_count: 43, favorited: false, in_reply_to_screen_name: "some updated in_reply_to_screen_name", in_reply_to_status_id: 43, in_reply_to_user_id: 43, reply_count: 43, retweet_count: 43, retweeted: false, text: "some updated text"}
    @invalid_attrs %{created_at: nil, favorite_count: nil, favorited: nil, in_reply_to_screen_name: nil, in_reply_to_status_id: nil, in_reply_to_user_id: nil, reply_count: nil, retweet_count: nil, retweeted: nil, text: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tweets.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Tweets.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Tweets.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Tweets.create_tweet(@valid_attrs)
      assert tweet.created_at == "some created_at"
      assert tweet.favorite_count == 42
      assert tweet.favorited == true
      assert tweet.in_reply_to_screen_name == "some in_reply_to_screen_name"
      assert tweet.in_reply_to_status_id == 42
      assert tweet.in_reply_to_user_id == 42
      assert tweet.reply_count == 42
      assert tweet.retweet_count == 42
      assert tweet.retweeted == true
      assert tweet.text == "some text"
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tweets.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, tweet} = Tweets.update_tweet(tweet, @update_attrs)
      assert %Tweet{} = tweet
      assert tweet.created_at == "some updated created_at"
      assert tweet.favorite_count == 43
      assert tweet.favorited == false
      assert tweet.in_reply_to_screen_name == "some updated in_reply_to_screen_name"
      assert tweet.in_reply_to_status_id == 43
      assert tweet.in_reply_to_user_id == 43
      assert tweet.reply_count == 43
      assert tweet.retweet_count == 43
      assert tweet.retweeted == false
      assert tweet.text == "some updated text"
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Tweets.update_tweet(tweet, @invalid_attrs)
      assert tweet == Tweets.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Tweets.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Tweets.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Tweets.change_tweet(tweet)
    end
  end
end
