require 'omniauth/oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class SweetSuite < OAuth2
      
      def initialize(app, client_id = nil, client_secret = nil, options = {}, &block)
        client_options = {
          :site => ::SweetSuite.config.auth_server,
          :authorize_url => ::SweetSuite.config.authorize_url,
          :access_token_url => ::SweetSuite.config.access_token_url
        }
        api_key ||= ::SweetSuite.config.app_key
        secret_key ||= ::SweetSuite.config.app_secret
        super(app, :sweetsuite, api_key, secret_key, client_options, options, &block)
      end
      
      protected
      
      def user_data
        @user_data ||= MultiJson.decode(@access_token.get('/profile.json'))
      end
      
      def request_phase
        options[:scope] ||= "read"
        super
      end
      
      def user_info
        {
          'email' => user_data['email']
        }
      end
      
      def auth_hash
        OmniAuth::Utils.deep_merge(super, {
          'uid' => user_data['id'],
          'user_info' => user_info,
          'extra' => user_data
        })
      end
    end
  end
end
