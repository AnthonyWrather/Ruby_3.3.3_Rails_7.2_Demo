# README

This is a sample application to demonstrate how you can create an app and develop it locally using Dev Containers.

* Ruby version : 3.3.3
* Rails version : 7.2.1.2

I use rbenv to install a local version of Ruby/Rails, once installed you can run the following
command to generate the initial project.

```bash
rails new blog_demo --css bootstrap --database=postgresql --devcontainer
```

Intro to Ruby on Rails 7 Fullstack Tutorial | Rails for Beginners Part 1
> https://www.youtube.com/watch?v=TlgSp2XPCY4&list=PL3mtAHT_eRezB9fnoIcKS4vYFjm23vddb&index=1&t=136s

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
````

