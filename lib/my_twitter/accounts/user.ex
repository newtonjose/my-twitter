defmodule MyTwitter.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :created_at, :string, default: NaiveDateTime.to_string(NaiveDateTime.utc_now())
    field :description, :string
    field :email, :string, unique: true
    field :favourites_count, :integer, default: 0
    field :followers_count, :integer, default: 0
    field :location, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :protected, :boolean, default: false
    field :screen_name, :string, unique: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :name,
      :email,
      :screen_name,
      :description,
      :location,
      :protected,
      :followers_count,
      :favourites_count,
      :created_at,
      :password
    ])
    |> validate_required([
      :email,
      :screen_name,
      :password
    ])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 6, max: 100)
    |> unique_constraint(:email)
    |> unique_constraint(:screen_name)
    |> hash_password
  end

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password))
  end

  defp hash_password(changeset) do
    changeset
  end
end
