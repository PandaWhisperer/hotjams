class HomeController < ApplicationController
  def index
  	# @access_token = facebook_cookies['access_token']
   #  @graph = Koala::Facebook::GraphAPI.new(@access_token)
  	@feed = Jam.order(:created_at)
  end

  def facebook_cookies
      @facebook_cookies ||= Koala::Facebook::OAuth.new(136929479838758, 'e6d7efb8098c019e4647c9e2563ce753').get_user_info_from_cookie(cookies)
  end
end
