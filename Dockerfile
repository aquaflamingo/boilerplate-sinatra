FROM ruby:2.5.7-alpine

# Update the installer
RUN apk update -qq && apk upgrade

# Install Deps
RUN apk add build-base \
   postgresql-dev \
   postgresql-client \
	 openssh \
	 git

# Convenience variable to use for our app working directory
ENV APP /app

# Create that directory in the base image
RUN mkdir $APP
WORKDIR $APP

# Add Gemfile and Gemfile.lock to app directory
ADD Gemfile* $APP/

RUN gem install bundler --version '~> 2.0.0'
RUN bundle install

ADD . $APP

EXPOSE 4567
