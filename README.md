# my-twitter
A simple Twitter API using Elixir, GraphQL and frontend by React &amp; Apollo GraphQL


# Createing new type

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

// Entidade User
```shell
mix phx.gen.context Users User users \
    name:string \
    screen_name:string \
    location:string \
    url:string \
    description:string \
    protected:boolean \
    followers_count:integer \
    favourites_count:integer \
    created_at:string
```
