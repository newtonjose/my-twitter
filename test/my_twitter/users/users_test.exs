defmodule MyTwitter.UsersTest do
  use MyTwitter.DataCase

  alias MyTwitter.Users

  describe "users" do
    alias MyTwitter.Users.User

    @valid_attrs %{" ": "some  ", id: 42}
    @update_attrs %{" ": "some updated  ", id: 43}
    @invalid_attrs %{" ": nil, id: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.  == "some  "
      assert user.id == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.  == "some updated  "
      assert user.id == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end

  describe "users" do
    alias MyTwitter.Users.User

    @valid_attrs %{created_at: "some created_at", description: "some description", favourites_count: 42, followers_count: 42, id: 42, location: "some location", name: "some name", protected: true, screen_name: "some screen_name", url: "some url"}
    @update_attrs %{created_at: "some updated created_at", description: "some updated description", favourites_count: 43, followers_count: 43, id: 43, location: "some updated location", name: "some updated name", protected: false, screen_name: "some updated screen_name", url: "some updated url"}
    @invalid_attrs %{created_at: nil, description: nil, favourites_count: nil, followers_count: nil, id: nil, location: nil, name: nil, protected: nil, screen_name: nil, url: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.created_at == "some created_at"
      assert user.description == "some description"
      assert user.favourites_count == 42
      assert user.followers_count == 42
      assert user.id == 42
      assert user.location == "some location"
      assert user.name == "some name"
      assert user.protected == true
      assert user.screen_name == "some screen_name"
      assert user.url == "some url"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.created_at == "some updated created_at"
      assert user.description == "some updated description"
      assert user.favourites_count == 43
      assert user.followers_count == 43
      assert user.id == 43
      assert user.location == "some updated location"
      assert user.name == "some updated name"
      assert user.protected == false
      assert user.screen_name == "some updated screen_name"
      assert user.url == "some updated url"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end

  describe "users" do
    alias MyTwitter.Users.User

    @valid_attrs %{created_at: "some created_at", description: "some description", favourites_count: 42, followers_count: 42, location: "some location", name: "some name", protected: true, screen_name: "some screen_name", url: "some url"}
    @update_attrs %{created_at: "some updated created_at", description: "some updated description", favourites_count: 43, followers_count: 43, location: "some updated location", name: "some updated name", protected: false, screen_name: "some updated screen_name", url: "some updated url"}
    @invalid_attrs %{created_at: nil, description: nil, favourites_count: nil, followers_count: nil, location: nil, name: nil, protected: nil, screen_name: nil, url: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.created_at == "some created_at"
      assert user.description == "some description"
      assert user.favourites_count == 42
      assert user.followers_count == 42
      assert user.location == "some location"
      assert user.name == "some name"
      assert user.protected == true
      assert user.screen_name == "some screen_name"
      assert user.url == "some url"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.created_at == "some updated created_at"
      assert user.description == "some updated description"
      assert user.favourites_count == 43
      assert user.followers_count == 43
      assert user.location == "some updated location"
      assert user.name == "some updated name"
      assert user.protected == false
      assert user.screen_name == "some updated screen_name"
      assert user.url == "some updated url"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
