require 'omniauth/strategies/sweetsuite'

module SweetSuite

  class Railtie < ::Rails::Railtie
    
    config.app_middleware.insert_after Rails::Rack::Logger,
                                       OmniAuth::Strategies::SweetSuite

  end
end
