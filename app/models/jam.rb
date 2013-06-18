class Jam < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.fetchAllFromFB
	graph = Koala::Facebook::API.new('CAACEdEose0cBAIuk8N31grstt9C8lo0rwSZBVCPcqZBQq33JAA56pB93nVc5SP6CXwkX1IYwhMXZAu0j7eDwTGu6EZBB6nQZCwWLtk9uhzI7SudKMRnmcSILZAzcwUjFdjWZBKZBZC1dTNdS6MDgt3WDxg3pQoxZA6SjZAQhox8C4l4QwZDZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 20} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams[0]
  end
end
