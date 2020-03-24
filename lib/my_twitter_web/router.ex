defmodule MyTwitterWeb.Router do
  use MyTwitterWeb, :router

  pipeline :api do
    plug(MyTwitterWeb.Plugs.Context)
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/api/graphql", Absinthe.Plug, schema: MyTwitterWeb.Schema)

    if Mix.env() == :dev do
      forward("/api/graphiql", Absinthe.Plug.GraphiQL, schema: MyTwitterWeb.Schema)
    end
  end
end
