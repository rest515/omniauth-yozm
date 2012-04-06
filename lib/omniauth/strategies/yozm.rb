require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Yozm < OmniAuth::Strategies::OAuth
      option :name, 'yozm'
      option :client_options, {:request_token_path => '/oauth/requestToken',
                               :authorize_path => '/oauth/authorize',
                               :access_token_path  => '/oauth/accessToken',
                               :site => 'https://apis.daum.net'}

      uid {
        raw_info['user']['url_name']
      }

      info do
       {
         :nickname => raw_info['user']['nickname'],
         :name => raw_info['user']['user_identity']['real_name'],
         :location => nil,
         :image => raw_info['user']['profile_img_url'],
         :description => raw_info['user']['user_info']['introduce'],
         :urls => {
           'Yozm' => 'http://yozm.daum.net/' + raw_info['user']['url_name'],
         }
       }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/yozm/v1_0/user/show.json').body)
        if @raw_info['status'] == '404' # when user doesn't join Yozm
          raise Exception
        end
        @raw_info
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
    end
  end
end