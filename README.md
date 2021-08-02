# World of events

A social network application with which users can create events, subscribe to them, leave comments on events,
as well as add photos to them.

A social network application with which users can create events, subscribe to them, leave comments on events,
as well as add photos to them.
Access restriction to the event by pin code is available.
To view the original size of the photo, they are displayed in the form of a gallery.
The address of the event is displayed on the built-in map using Yandex.map
Users receive information about updating events (added a comment, photo, or a new subscriber for the event) by email.
Authorization via email, Facebook and Github is available in the application.
In a production environment, Amazon S3 is used to store photos added to the event.

## Ruby and Ruby on Rails version

- Ruby 3.0.0

- Rails  6.1.3

## Deploy app

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

## How to run app

To start the Rails server, type

```ruby
rails s
```
