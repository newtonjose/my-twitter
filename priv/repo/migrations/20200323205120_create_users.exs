defmodule MyTwitter.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :screen_name, :string
      add :description, :string
      add :location, :string
      add :protected, :boolean, default: false, null: false
      add :followers_count, :integer
      add :favourites_count, :integer
      add :created_at, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:users, [:email, :screen_name])
  end
end
