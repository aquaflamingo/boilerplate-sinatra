# frozen_string_literal: true

# Load all relevant gems from Gemfile via Bundler
require 'bundler'
Bundler.require

class Application < Sinatra::Base
  set :root, File.dirname(__FILE__)
  require File.join(root, '/config/autoloader.rb')

  set :logger, AppLog

  # Allow file modification reloads in development
  configure :development do
    register Sinatra::Reloader
  end

  # JSON Api
  before { content_type 'application/json' }

  # Health check
  get '/ok' do
    { message: 'ok' }.to_json
  end
end
