class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
    graph = Koala::Facebook::API.new('CAACEdEose0cBABG5TkvYkmdXLJbZBNb4M3xTukxB5uzZCJKEqXnZCojyZCYEAjtTKOodLiZBpFVtpiV59i7sRFuMxgM0neZBpfuE5t83dWn50y46MsKWZByZAtumAyj9ZCBUoGHHzvRY37SK6ckBaMJsRmA5su6hQirUiOjzOn9nMHdLzBRNapZBkON5EWYFSIGWkZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 200} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams
  end

end
