module SweetSuite
  
  def config
    @@config || Configuration.new
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
  
end

require "sweetsweet/railtie" if defined?(Rails)
