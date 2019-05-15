FROM ruby:2.5.3

RUN apt-get update && apt-get install -y nodejs postgresql-client vim --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY . $APP_ROOT
RUN bundle install --without development test
RUN rake assets:precompile
