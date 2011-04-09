module SweetSuite

  # A collection of helper to be included by the ApplicationController.
  module Helpers

    extend ActiveSupport::Concern
    
    included do
      if respond_to? :helper_method
        helper_method :current_user, :user_signed_in?
      end
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
      @current_user ||= SweetSuite::User.profile(ss_api)
    end

    # @return An OAuth2::AccessToken that can be used to use the SS API
    def ss_api
      @ss_api ||= SweetSuite::Api.new(access_token)
    end

  end

end
