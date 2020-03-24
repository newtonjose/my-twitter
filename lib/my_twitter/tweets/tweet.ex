defmodule MyTwitter.Tweets.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyTwitter.Account.User

  schema "tweets" do
    field :created_at, :string, default: NaiveDateTime.to_string(NaiveDateTime.utc_now())
    field :favorite_count, :integer, default: 0
    field :favorited, :boolean, default: false
    field :in_reply_to_screen_name, :string
    field :in_reply_to_status_id, :integer
    field :in_reply_to_user_id, :integer
    field :reply_count, :integer, default: 0
    field :retweet_count, :integer, default: 0
    field :retweeted, :boolean, default: false
    field :text, :string

    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [
      :text,
      :reply_count,
      :retweet_count,
      :favorite_count,
      :favorited,
      :retweeted,
      :in_reply_to_status_id,
      :in_reply_to_user_id,
      :in_reply_to_screen_name,
      :created_at
    ])
    |> validate_required([
      :text,
      :user_id
    ])
    |> validate_length(:text, max: 140)
  end
end
