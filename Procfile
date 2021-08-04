web: bundle exec puma -C config/puma.rb

resque: QUEUE=telebot* rake environment resque:work
