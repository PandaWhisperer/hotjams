class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAJERMsSHgCCghqXRuTPfXE533w6GNSsG1U0UQUR3XjSauKLrceBcbaH4htPDiZAcNRN6ivzzZAoVrJsS0GVyFywpCOJUlnEvzage7nV0m1hVxedyqWGrnltN4oNByfZCqqNAiCXaMI7WWyD5iJfXAV3Om9eGAZDZD')
  	fb_feed = @graph.get_connections("232990736786590", "feed", { :limit => 1} )
  	@feed = []
  	fb_feed.each do |post|
  		@feed << post unless ( post.nil? || post['source'].nil? )
  	end
  end
end
