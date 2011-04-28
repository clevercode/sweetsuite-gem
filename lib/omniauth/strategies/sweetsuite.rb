require 'omniauth/oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class SweetSuite < OAuth2
      
      def initialize(app, consumer_key = nil, consumer_secret = nil, options = {}, &block)
        client_options = {
          :site => ::SweetSuite.config.auth_server,
          :authorize_path => 'oauth/authorize',
          :access_token_path => 'oauth/access_token'
        }
        consumer_key ||= ::SweetSuite.config.app_key
        consumer_secret ||= ::SweetSuite.config.app_secret

        super(app, :sweetsuite, consumer_key, consumer_secret, client_options, options, &block)
      end
      
      protected
      
      def user_data
        @user_data ||= MultiJson.decode(@access_token.get('/profile.json'))
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
