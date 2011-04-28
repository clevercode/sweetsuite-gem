require 'omniauth/strategies/sweetsuite'

module SweetSuite

  class Railtie < ::Rails::Railtie
    
    config.app_middleware.insert_after ActionDispatch::Session::CookieStore,
                                       OmniAuth::Strategies::SweetSuite

  end
end
