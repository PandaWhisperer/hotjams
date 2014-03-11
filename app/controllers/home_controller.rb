class HomeController < ApplicationController
  def index
  	# @oauth = Koala::Facebook::OAuth.new(, )
  	# @oauth.get_user_info_from_cookies(cookies)
  	# @access_token = facebook_cookies
    # @graph = Koala::Facebook::GraphAPI.new(@access_token)
   	# @oauth = Koala::Facebook::OAuth.new(app_id, app_secret, callback_url)
  	# @feed = Jam.order(:created_at)
  end

  def facebook_cookies
  		puts cookies.to_s
      # @facebook_cookies ||= Koala::Facebook::OAuth.new(Facebook::APP_ID, Facebook::SECRET).get_user_info_from_cookie(cookies)
  end
end
