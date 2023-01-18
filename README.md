# World of events

A social network application with which users can create events, subscribe to them, leave comments on events,
as well as add photos to them.

Access restriction to the event by pin code is available.
To view the original size of the photo, they are displayed in the form of a gallery.

The address of the event is displayed on the built-in map using `Yandex.map`.

Users receive information about updating events (added a comment, photo, or a new subscriber for the event) by email.

Authorization via `email` and `Github` is available in the application.

In a production environment, `Amazon S3` is used to store photos added to the event.

`PostgreSQL` is used as a powerful, open source object-relational database system.

For the development of the frontend, used `bootstrap 4.x` and `webpacker 5.x`.

## Ruby and Ruby on Rails version

- Ruby 3.1.2

- Rails  6.1.3

## The main gems used in the application:

`carrierwave` - upload files in your Ruby applications, map them to a range of ORMs, store them on different backends;

`devise` - flexible authentication solution for Rails with Warden;

`pundit` - object oriented authorization for Rails applications;

`rails-i18n` - Internationalization support for Ruby;

`capistrano` - deploy to VPS;

`resque + redis` - for background jobs;

## Deploy app local

Note: all commands must be run from the command line/terminal, from the directory, where you clone repository

1. Download or clone repository, then run bundler

```ruby
bundle exec install
```

2. To create a database, run

```ruby
rails db:schema:load
```

3. Credentials setup

For the application to work correctly in a `production environment`, add the following keys and their values
to your `credentials.yml.enc` file:

```ruby
EDITOR=nano rails credentials:edit
```

```ruby
yandex:
  maps_api_key:

production_db:
  database:
  username:
  password:

zoho:
  username:
  password:

aws:
  s3_access_key:
  s3_secret_key:
  s3_region:
  s3_bucket_name:

development:
  github:
    omniauth_id:
    omniauth_secret:

production:
  github:
    omniauth_id:
    omniauth_secret:
```

## Deploy on Heroku

1. Attach Heroku Redis to an application via the CLI:

```ruby
heroku addons:create heroku-redis:hobby-dev -a your-app-name
```

2. Add your master.key to Heroku Config Vars

```ruby
heroku config:set RAILS_MASTER_KEY=123456789
```

3. Deploy app on Heroku

```ruby
git push heroku master
```

## How to run app

To start the Rails server, type

```ruby
rails s
```
