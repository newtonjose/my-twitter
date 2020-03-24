# my-twitter
A simple GraphQL API implementing the objects
[User](https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/user-object), 
[Tweet](https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/tweet-object) using the Twitter API as docs ref.

## Instalation
// Setup using docker-compose to get backend and front

## GraphQL Exemples

- To use the API,
> Fiist create a user
```javascript
mutation createUser {
  userSignUp(
    object: {
      email: "email@domain.<any>",
      password:"passwd",
      screenName: "my_nickname",
      createdAt: "2020-03-24 06:06:00 UTC-3"
    }
  ) {
    id
  }
}
```

> Authenticate to get JWT token
```javascript
mutation authenticateUser {
  userAuth(
    object: {
      email: "email@domain.<any>",
      password:"passwd"
    }
  ) {
    user{
      id
      name
      description
      screenName
    }
    token
  }
}
```

> Ccpy the `token` and add on Headers

__Header Name__     |   __Header Value__
--------------------|----------------------
Authorization       |   Bearer *token*


// queries, mutations: create, update, delete

## DB Schemas (docs)

- User

```bash
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

- Tweet

```bash
mix phx.gen.schema Tweet tweets \
    text:text \
    reply_count:integer \
    retweet_count:integer \
    favorite_count:integer \
    favorited:boolean \
    retweeted:boolean \
    in_reply_to_status_id:integer \
    in_reply_to_user_id:integer \
    in_reply_to_screen_name:string \
    created_at:string \
    user_id:references:users
```

```bash
mix ecto.migrate
```