class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
	graph = Koala::Facebook::API.new('CAACEdEose0cBADFmfameTZAPLoad49STXNCToyY7NiLan7cK1AsXJggWaCNCXSBARxZAqk6QHcavhhzsymnWuAZClSOCA7KhkR8ddWoSKhyMuzjWedJHx2dz9sMt6n5YVM1nuU9eU2ZAoEp0GjDZA2OSndgHgspAKFph5REL8mwZDZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 20} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams
  end

end
