FROM ruby:2.1.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /nomad
WORKDIR /nomad
ADD Gemfile /nomad/Gemfile
RUN bundle install
ADD . /nomad
