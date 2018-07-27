FROM ruby:2.5.0

COPY gai.conf /etc/gai.conf
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_ENV production
ENV SECRET_KEY_BASE 9ec7f99d14329f2547576161a696c3cd2fc8b10d1b624ef5a5d9e97b6ea86ff95a8515668931e7cd6bacd2901b6106e1f3c71c615f77068dccb1a64c2bbfad21

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install --without development test
COPY . .

EXPOSE 3000
CMD bundle exec rake db:create
CMD bundle exec puma -C config/puma.rb
