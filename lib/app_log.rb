# frozen_string_literal: true

class AppLog
  extend SingleForwardable

  def_delegators :logger, :info, :warn, :debug, :error

  class << self
    def logger
      @_logger ||= Logger.new(STDOUT)
    end
  end
end
