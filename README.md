# my-twitter
A simple Twitter API using Elixir, GraphQL and frontend by React &amp; Apollo GraphQL


### DB Schemas

- User

```shell
mix phx.gen.schema User users \
    name:string \
    email:strig \
    screen_name:string \
    description:string \
    location:string \
    url:string \
    protected:boolean \
    followers_count:integer \
    favourites_count:integer \
    created_at:string \
    password_hash:string
```

```shell
mix ecto.migrate
```

<!-- Criar um schema links: url:string description:text -->
mix phx.gen.context News Link links url:string description:text

// Entidade Tweet
```shell
mix phx.gen.context Tweets Tweet tweets \
    created_at:string \
    text:text \
    truncated:boolean \
    in_reply_to_status_id:integer \
    in_reply_to_user_id:integer \
    in_reply_to_screen_name:string \
    reply_count:integer \
    retweet_count:integer \
    favorite_count:integer \
    favorited:boolean \
    retweeted:boolean \
    user:User
```
