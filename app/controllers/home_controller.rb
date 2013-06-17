class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBALpEjpo94OQ9ENFCEU8ZChlSJzeEpZCylxLuR5vLLEEBZB5Df1wVDQxsCZBe95jHFYYglU1J1ZCiVnA3j7oQ5kdt34CdI73SeGLSlSklcQokZAfZAl6IaoRSfb6bZBX9mZC487Ju7DChlpgEjlIKPRDPu4V48LuWWqgZDZD')
  	fb_feed = @graph.get_connections("232990736786590", "feed", { :limit => 20} )
  	@feed = []
  	fb_feed.each do |post|
  		@feed << post unless ( post.nil? || post['source'].nil? )
  	end
  end
end
