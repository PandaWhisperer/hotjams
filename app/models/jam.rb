class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
    hotjams_page_id = "232990736786590";
    user = User.order("updated_at").last
    access_token = user.auth_token

    graph = Koala::Facebook::API.new(access_token)
    
    fb_feed = graph.get_connections(hotjams_page_id, "feed", { :limit => 200} )
    
    jams = [] 
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    
  end

end
