# frozen_string_literal: true

# Load application from main sinatra app
require File.expand_path('app', File.dirname(__FILE__))

# Visit localhost:4567/ to go to app
run Rack::URLMap.new('/' => Application)
