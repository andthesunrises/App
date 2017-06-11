# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



To startup the Postgres database, the command is:

```
sudo service postgresql start
```

To generate a new rails application, the command is:

```
rails new AppName -T --database=postgresql
```


Create and migrate the database:

```
rails db:create && rails db:migrate
```

To run the Rails server on C9, the command is:

```
rails s -b $IP -p $PORT
```

to clear out git cache

```
git rm . -r --cached
```

