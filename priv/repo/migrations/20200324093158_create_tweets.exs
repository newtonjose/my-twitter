defmodule MyTwitter.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :text, :text
      add :reply_count, :integer
      add :retweet_count, :integer
      add :favorite_count, :integer
      add :favorited, :boolean, default: false, null: false
      add :retweeted, :boolean, default: false, null: false
      add :in_reply_to_status_id, :integer
      add :in_reply_to_user_id, :integer
      add :in_reply_to_screen_name, :string
      add :created_at, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tweets, [:user_id])
  end
end
