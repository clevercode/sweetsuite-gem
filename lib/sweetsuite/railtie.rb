require 'omniauth/strategies/sweetsuite'

module SweetSuite

  class Railtie < ::Rails::Railtie
    
    config.app_middleware.insert_before ActionDispatch::Static,
                                        OmniAuth::Strategies::SweetSuite

  end
end
