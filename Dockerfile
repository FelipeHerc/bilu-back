FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /bilu
WORKDIR /bilu
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem update --system
RUN gem install bundler
RUN bundler update --bundler
RUN bundle install
COPY . /bilu