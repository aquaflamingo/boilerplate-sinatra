# frozen_string_literal: true

# Specific require statements for application
require 'sinatra/base'
require 'sinatra/reloader'

AUTOLOAD_PATHS = [
  'config/*.rb',
  'lib/*.rb'
].freeze

AUTOLOAD_PATHS.each do |path|
  # We expect the Application object to have been loaded already
  # given that we require the autoloader inside it
  Dir[File.join(Application.root, path)].sort.each do |file|
    # Don't re-require the autoloader file
    next if file.include?('autoloader')

    require file
  end
end
