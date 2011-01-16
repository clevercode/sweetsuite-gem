module SweetSuite

  # A collection of helper to be included by the ApplicationController.
  module Helpers

    extend ActiveSupport::Concern
    
    included do
      helper_method :current_user, :user_signed_in?
    end
    
    # Should be used as a before filter to restrict access to SweetSuite users
    def authenticate_user!
      redirect_to '/auth/sweetsuite' unless access_token && current_user
    end

    # @return The access token stored in the session
    def access_token
      session[:access_token]
    end

    # @return The current user as a Hash of values returned from the API
    def current_user
      @current_user ||= MultiJson.decode(ss_api.get('profile.json'))['user']
    end

    # @return An OAuth2::AccessToken that can be used to use the SS API
    def ss_api
      @ss_api ||= OAuth2::AccessToken.new(ss_client, access_token) 
    end
    
    # @return An OAuth2::Client that is used to get an AccessToken
    def ss_client
      @ss_client ||= OAuth2::Client.new(SweetSuite.config.app_key, SweetSuite.config.app_secret, {:site => SweetSuite.config.auth_server} )
    end


  end

end
