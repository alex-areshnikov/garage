FROM ruby:2.5.3

RUN apt-get update && apt-get install -y postgresql-client vim --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

ENV RAILS_ENV production
ENV APP_ROOT /app

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY . $APP_ROOT

RUN bundle install --without development test
RUN rake assets:precompile
RUN rm config/master.key
