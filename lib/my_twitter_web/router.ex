defmodule MyTwitterWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug MyTwitterWeb.Context
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/v1/graphiql", Absinthe.Plug.GraphiQL, schema: MyTwitterWeb.Schema

    forward "/", Absinthe.Plug, schema: MyTwitterWeb.Schema
  end
end
