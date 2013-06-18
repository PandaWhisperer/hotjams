class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAIuk8N31grstt9C8lo0rwSZBVCPcqZBQq33JAA56pB93nVc5SP6CXwkX1IYwhMXZAu0j7eDwTGu6EZBB6nQZCwWLtk9uhzI7SudKMRnmcSILZAzcwUjFdjWZBKZBZC1dTNdS6MDgt3WDxg3pQoxZA6SjZAQhox8C4l4QwZDZD')
  	fb_feed = @graph.get_connections("232990736786590", "feed", { :limit => 20} )
  	@feed = []
  	fb_feed.each do |post|
  		@feed << post unless ( post.nil? || post['source'].nil? )
  	end
  end
end
