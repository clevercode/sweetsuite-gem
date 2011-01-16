require 'sweetsuite/configuration'

module SweetSuite
  
  def config
    @config ||= Configuration.new
  end
  
  # Configure SweetSuite integration.
  # @example
  #   SweetSuite.config.setup do |ss|
  #     ss.auth_server 'auth.sweetswuiteapp.com'
  #   end
  #
  def setup
    yield(config)
    config
  end

  extend self
end

require "sweetsuite/railtie" if defined?(Rails)
