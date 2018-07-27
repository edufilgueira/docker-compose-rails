FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /principal

WORKDIR /principal

COPY principal/Gemfile /principal/Gemfile

COPY principal/Gemfile.lock /principal/Gemfile.lock

RUN bundle install

COPY principal /principal

EXPOSE 3000

CMD bundle exec rake db:create

CMD bundle exec puma -C config/puma.rb
