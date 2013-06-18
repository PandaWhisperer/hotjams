class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user


  def self.fetchAllFromFB
	graph = Koala::Facebook::API.new('CAACEdEose0cBAImeShwKWZAC61gIfcPAIzQH4GgzQWUZCKiKkwHSKF17rJKotwviZCyUzt760NkJqp0qo5PntwOxDPjDVOj7ICzqIBRJZAgnKWMrZCWd7ZApBKP1xQCtZAbl8q5kniaBwQkuFT1nARZC1NtJ3a0Ftm4rNC56KMfIegZDZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 20} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams
  end
  
end
