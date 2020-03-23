defmodule MyTwitter.User do
  use MyTwitter.Model

  alias MyTwitter.{Repo, Conversation, Post, User}

  schema "users" do
    field :email, :string
    field :name, :string
    field :screen_name, :string
    field :description, :string
    field :location, :string
    field :protected, :boolean
    field :url, :string
    field :followers_count, :integer
    field :favourites_count, :integer
    field :created_at, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :token, :string, virtual: true

    many_to_many :conversations, Conversation, join_through: "conversation_users"
    has_many :posts, Post

    timestamps()
  end

  def search(search_term, current_user) do
    Repo.all(
      from u in __MODULE__,
        where: ilike(u.name, ^("%" <> search_term <> "%"))
        or ilike(u.screen_name, ^("%" <> search_term <> "%"))
        and u.id != ^current_user.id,
        limit: 25
    )
  end

  def changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, [:screen_name, :name, :email, :description, :location,
      :protected, :url, :followers_count, :favourites_count, :password])
    |> validate_required([:screen_name, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:users, name: :users_screen_name_email_index)
    |> put_password_hash
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
