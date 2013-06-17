class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAFYBhi2A6rvyY30MHdNnE9h7GoiO7mvOgqmMSEteZAAehlEagDSBnDQLyKZBWV09GPxfyZB0r0xY5o3GsY66EZB7OEkYKZAHBDZBDwS6bVcuoC9vbTRZBBN31Sq775h5kjQj5gMDuKqrPyyBESActg2nYmKktTnugZDZD')
  	fb_feed = @graph.get_connections("232990736786590", "feed", { :limit => 20} )
  	@feed = []
  	fb_feed.each do |post|
  		@feed << post unless ( post.nil? || post['source'].nil? )
  	end
  end
end
