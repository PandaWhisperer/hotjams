class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
	graph = Koala::Facebook::API.new('CAACEdEose0cBAF8AkgkZAfnMu4BrLNVlfxYCoUtDD3CFKS2nnfyFS9ZBAVBFfzRdR86aoAhIxBILavBPX5bgOt6qdbp7TZBDT5wIAQ7Oeep2V3N2w7IkeNqZAVzQbpanqkcGNSf5CGMcE8kXHs7qgQNmlsrpdZAroXMZBZAW3BimAZDZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 20} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams
  end

end
