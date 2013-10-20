class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
    graph = Koala::Facebook::API.new('CAACEdEose0cBAKVDQyfl0Vq05TjrLY7SQcv4nEnNywoF2X7ZC1jJ8oXnr1XxEPw2J4aDd9uOfHygwXucShRsdtIMoaBw5CnAcPJoY5LeH8mZCbBWRV9zhyivLt6tX0OXeyfrXOahimE94JHjaCSv0Aq7mePn8GNF2hzLyvXZCXzoWMx5ivqSQFbYG8BZCdQZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 2000} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams
  end

end
