module SweetSuite
  
  class Configuration
    
    attr_accessor :auth_server,
                  :app_key,
                  :app_secret,
                  :app_name
    
    def initialize(settings = {})
      update(settings)
    end

    def update(settings)
      @auth_server  = settings[:auth_server]  
      @app_key      = settings[:app_key]
      @app_secret   = settings[:app_secret]
      @app_name     = settings[:app_name]
    end
    
  end
  
end
