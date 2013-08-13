class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
	graph = Koala::Facebook::API.new('CAACEdEose0cBABo1PrtCVVoUEzWvkgbfOuyyTZAg59BxfvHx3WsuijIEuxFwCrJc8BMZATnGbBffdtpeNbVcxPIZAfIhtpPHOqYdR0vzgUMZAWpj6GHMlipWrFcqd3rSCR93b5DDTaDd7BZC2Q5OiSYFPnNHQWugs5VFKZA2ifXQZDZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 20} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams
  end

end
