class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAIiO27aSWCPtI6ZCCeGTDcYG4ZAwj1YYlN7cpfFqt9bUZCDZBKRNSzRPdSd06KCXjaf7eBNZCsRqz23lRAQHd5ZBpSJDKYIwMXK0ctddJdTijs4M08FWDSsjatcdq7Pys9vmn12JzZBej09pGXmZBGWe34sRTmsuzQZDZD')
  	fb_feed = @graph.get_connections("232990736786590", "feed", { :limit => 20} )
  	@feed = []
  	fb_feed.each do |post|
  		@feed << post unless ( post.nil? || post['source'].nil? )
  	end
  end
end
