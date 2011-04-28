module SweetSuite

  autoload :Api,            'sweet_suite/api'
  autoload :Configuration,  'sweet_suite/configuration'
  autoload :Helpers,        'sweet_suite/helpers'
  autoload :User,           'sweet_suite/user'
  
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

require "sweet_suite/railtie" if defined?(Rails)
