module SweetSuite

  class Railtie < ::Rails::Railtie
    
    config.middlewares.use OmniAuth::Strategies::SweetSuite

  end
end
