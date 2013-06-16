class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAHPFBOL7nP66ymbuEyxhrmGAzJZCV7aNBdcbMZALD9rog7Q3Fc1WrCM7pp8TBL3cfVGkw4wA7oOiUGZB9ydxzdWqiljNtFXBGTKD77Esk3QSlvhxajZBxXVQL4ZCZBkT4sDzZCT1pBKO1D8K3dnaaPzbXs0aG8QXwZDZD')
  	fb_feed = @graph.get_connections("232990736786590", "feed", { :limit => 1} )
  	@feed = []
  	fb_feed.each do |post|
  		@feed << post unless ( post.nil? || post['source'].nil? )
  	end
  end
end
