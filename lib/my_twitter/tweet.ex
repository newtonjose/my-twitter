defmodule MyTwitter.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

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
    field :user_id, :id

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
  end
end
