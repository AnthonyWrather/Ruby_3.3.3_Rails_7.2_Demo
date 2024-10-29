# README

This is a sample application to demonstrate how you can create an app and develop it locally using Dev Containers.

* Ruby version : 3.3.3
* Rails version : 7.2.1.2

---

I use rbenv to install a local version of Ruby/Rails, once installed you can run the following
command to generate the initial project.

```bash
rails new blog_demo --css bootstrap --database=postgresql --devcontainer
```

---

[Intro to Ruby on Rails 7 Fullstack Tutorial](https://www.youtube.com/watch?v=TlgSp2XPCY4&list=PL3mtAHT_eRezB9fnoIcKS4vYFjm23vddb&index=1&t=136s)

Added pgadmin to the Dev Containers setup in .devcontainer/compose.yaml

```yaml
  pgadmin:
    image: dpage/pgadmin4
    restart: unless-stopped
    environment:
      PGADMIN_DEFAULT_EMAIL: "pgadmin@pgadmin.com"
      PGADMIN_DEFAULT_PASSWORD: "password"
    volumes:
      - pgadmin-data:/var/lib/pgadmin
    ports:
      - "15432:80"
    depends_on:
      - postgres

  volumes:
    pgadmin-data:
```

Run the following to enable you to publish to GitHub

```bash
  git config --global --add safe.directory /workspaces/blog_demo
```

Then run the following to add the home page etc.

```bash
  rails g controller pages home about
```
<p> Lots of code editing lol </p>

<p> Create the db table for the Posts and check the db is setup correctly. </p>

```bash
  rails g scaffold post title:string body:text
  rails db:migrate

  rails c
  blog-demo(dev)> Post.create(title: "Title 1", body: "Body 1")
  blog-demo(dev)> Post.create(title: "Title 2", body: "Body 2")

  blog-demo(dev)> @post = Post.find(1)
  blog-demo(dev)> @post.title
  => "Title 1"
  blog-demo(dev)> @post.body
  => "Body 1"

  blog-demo(dev)> @post = Post.last(2)
  blog-demo(dev)> @post
  =>
  [#<Post:0x00007f7e3c4f8988
    id: 1,
    title: "Title 1",
    body: "Body 1",
    created_at: "2024-10-28 20:51:18.790702000 +0000",
    updated_at: "2024-10-28 20:51:18.790702000 +0000">,
  #<Post:0x00007f7e3c4f8ac8
    id: 2,
    title: "Title 2",
    body: "Body 2",
    created_at: "2024-10-28 20:56:04.237105000 +0000",
    updated_at: "2024-10-28 20:56:04.237105000 +0000">]

  blog-demo(dev)> exit

  rails db:drop
  rails db:create
  rails db:migrate
```

---

[Intro to Devise in Rails 7](https://www.youtube.com/watch?v=m3uhldUGVes&list=PL3mtAHT_eRezB9fnoIcKS4vYFjm23vddb&index=2)

```bash
rails g migration add_views_to_posts views:integer
rails db:migrate
```

<p>Add devise to Gemfile</p>
```bash
bundle install
rails g devise:install
```

```bash
rails g devise User
rails db:migrate
```

<p>"Error with stale data."</p>

```bash
rails g migration add_user_to_posts user:belongs_to
rails c
blog-demo(dev)> Post.destroy_all
blog-demo(dev)> exit
rails g migration add_user_to_posts user:belongs_to
rails db:migrate
rails db:seed
```

```bash
rails g migration add_name_to_user name:string
rails db:migrate

rails g devise:views
rails g devise:controllers users

rails g controller users profile

rails g migration add_views_to_user views:integer
rails db:migrate
rails g migration change_views_for_users
rails db:migrate

rails c
blog-demo(dev)* User.all.each do |user|
blog-demo(dev)*   user.views = 0
blog-demo(dev)*   user.save
blog-demo(dev)> end
```

---

[Intro To Rich Comments In Rails 7](https://www.youtube.com/watch?v=ngL4B5rtaeQ&list=PL3mtAHT_eRezB9fnoIcKS4vYFjm23vddb&index=3)

```bash
rails g model comment post:belongs_to user:belongs_to
rails db:migrate
```

```bash
rails action_text:install
bundle install
rails db:migrate
```

```bash
rails g controller comments
```

---

GitHub CI failure.

Edit the Gemfile, add the folowing line and reinstall.

```bash
gem "net-pop", github: "ruby/net-pop"
bundle install
```
Also on a resart of the Dev Container you nneed to set the git permissions. Need to add this to the start script.


```bash
git config --global --add safe.directory /workspaces/blog_demo
```

---

[Intro To Editing Comments With Stimulus In Rails 7](https://www.youtube.com/watch?v=A4cDwj0JYVo&list=PL3mtAHT_eRezB9fnoIcKS4vYFjm23vddb&index=4)



---
