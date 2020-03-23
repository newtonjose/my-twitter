defmodule MyTwitterWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias MyTwitterWeb.Schema.Types

  import_types(Types.UserType)
end
