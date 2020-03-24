defmodule MyTwitterWeb.Resolvers.SessionResolver do
  alias MyTwitter.{Accounts, Guardian}

  def user_auth(_, %{input: input}, _) do
    with {:ok, user} <- Accounts.Session.authenticate(input),
         {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end
end
