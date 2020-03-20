defmodule MyTwitter.Tweets.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyTwitter.{ Users }

  schema "tweets" do
    field :created_at, :string
    field :favorite_count, :integer
    field :favorited, :boolean, default: false
    field :in_reply_to_screen_name, :string
    field :in_reply_to_status_id, :integer
    field :in_reply_to_user_id, :integer
    field :reply_count, :integer
    field :retweet_count, :integer
    field :retweeted, :boolean, default: false
    field :text, :string
    field :truncated, :boolean, default: false

    belongs_to :users, Users

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [
        :created_at, :text, :truncated, :in_reply_to_status_id,
        :in_reply_to_user_id, :in_reply_to_screen_name, :reply_count,
        :retweet_count, :favorite_count, :favorited, :retweeted, :user_id
      ])
    |> validate_required([
        :created_at, :text, :truncated, :in_reply_to_status_id,
        :in_reply_to_user_id, :in_reply_to_screen_name, :reply_count,
        :retweet_count, :favorite_count, :favorited, :retweeted, :user_id
      ])
    |> foreign_key_constraint(:user_id)

  end
end
