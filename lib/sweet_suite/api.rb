module SweetSuite
  # Provides a customized OAuth connection into the SS API
  class Api

    def initialize(access_token = nil)
      @access_token = access_token
    end

    def token
      @token ||= OAuth2::AccessToken.new(client, @access_token) 
    end

    def client
      @client ||= OAuth2::Client.new(
        SweetSuite.config.app_key, 
        SweetSuite.config.app_secret, 
        {:site => SweetSuite.config.auth_server}
      )
    end

    # Perform a GET request on the API
    # @param path the path to the resource
    def get(*args)
      token.get(*args)
    end
    
  end
end
