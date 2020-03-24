defmodule MyTwitterWeb.Resolvers.UserResolver do
  alias MyTwitter.Accounts

  def users(_, _, %{context: context}) do
    IO.inspect(context)
    {:ok, Accounts.list_users()}
  end

  def user_sign_up(_, %{input: input}, _) do
    Accounts.create_user(input)
  end
end
