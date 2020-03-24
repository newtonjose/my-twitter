defmodule MyTwitterWeb.Schema do
  use Absinthe.Schema

  import_types(MyTwitterWeb.Schema.UserType)
  import_types(MyTwitterWeb.Schema.SessionType)
  import_types(MyTwitterWeb.Schema.TweetType)

  query do
    import_fields(:user_queries)
    import_fields(:tweet_queries)
  end

  mutation do
    import_fields(:user_mutations)
    import_fields(:tweet_mutations)
  end
end
