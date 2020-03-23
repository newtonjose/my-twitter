defmodule MyTwitter.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :screen_name, :string
      add :password_hash, :string
      add :description, :string
      add :location, :string
      add :protected, :boolean
      add :url, :string
      add :followers_count, :integer
      add :favourites_count, :integer
      add :created_at :string

      timestamps()
    end

    create unique_index(:users, [:screen_name, :email])

  end
end
