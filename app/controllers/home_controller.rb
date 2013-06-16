class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAOrHSFPEqHSZA0i3YozZCYnp6Scyq31GEZAvdInpemM8OZALyABQ9utyYsXV3CEz9kGaze95xd6UOdwA4LjsQ7xQZAH4GMM623Wryf7lWeB6LKvf9V0rtVf4AuNGW2h1dyvY2ZBDWZA9GVb6vI1Mq9YtrxSCqAEAwZDZD')
  	fb_feed = @graph.get_connections("232990736786590", "feed", { :limit => 20} )
  	@feed = []
  	fb_feed.each do |post|
  		@feed << post unless ( post.nil? || post['source'].nil? )
  	end
  end
end
