class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
	graph = Koala::Facebook::API.new('CAACEdEose0cBACwwBGGD9ISgCDyGZBbFPCOA0bKzyqImzW4X3tPIZAUFWkKh5TVZA5j8dEmOQCwacuLCBTWGnRLsmmZAEVZCsYMFbGqs9uDoNXHl6VYE6o56V92WslU3VvwBuXdXi7ZBMB0WyDcamlQ6eZCmGdjWPZBo4lfnBvOoUL9ad5VW4V2t51BzVZBNkubxsBEMNRaTmcAZDZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 20} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams
  end

end
