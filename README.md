
# Ruby On Rails Postgre

A restfullapi project


## Installation


```bash
rails new redwhite_project --api --minimal --database=postgresql
```

```bash
rails g resource Minister first_name last_name genre

# This is also be written as:
# rails g resource Minister first_name:string last_name:string genre:string

```


```bash
rails db:create db:migrate
rails server
```

```bash
http://127.0.0.1:3000/
```
    
## Documentation

- https://redhabayuanggara.hashnode.dev/building-a-restful-api-with-rails
- https://startup-house.com/blog/creating-a-project-with-ruby-on-rails


