defmodule MyTwitterWeb.Router do
  use MyTwitterWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(MyTwitterWeb.Plugs.Context)
  end

  scope "/api" do
    pipe_through(:api)

    forward("/api/graphql", Absinthe.Plug, schema: MyTwitterWeb.Schema)

    if Mix.env() == :dev do
      forward("/api/graphiql", Absinthe.Plug.GraphiQL, schema: MyTwitterWeb.Schema)
    end
  end
end
