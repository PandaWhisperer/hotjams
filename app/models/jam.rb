class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user, :created_at, :updated_at
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
    hotjams_page_id = "232990736786590";
    user = User.where("auth_token IS NOT NULL").order("updated_at").last
    access_token = user.auth_token

    graph = Koala::Facebook::API.new(access_token)
    
    fb_feed = graph.get_connections(hotjams_page_id, "feed", { :limit => 500} )
    jams = [] 
    fb_feed.each do |post|
      jams << post unless ( post.nil? || !post.has_key?('source') || post['source'].nil? )
    end
    jams

  end

end
