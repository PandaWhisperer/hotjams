class Jam < ActiveRecord::Base
  attr_accessible :name, :source, :picture, :user
  belongs_to :user
  validates_uniqueness_of :source, :on => :create, :message => "must be unique"


  def self.fetchAllFromFB
	graph = Koala::Facebook::API.new('CAACEdEose0cBAA08cB6YZBap9xkdmDiInMFoaVuUdOb2c0SyiBSZAUOfYN5oNBIBJZC54q0ZBiFZChGifGqK2cw8fEjQDF4GPLUKV3GeXwt3bHkuhXqO2jtmJGwkF1vcf7jspa2wf3tUZA8Ti02EYqU5F4vdc9pKCrIji9hUl7LAZDZD')
    fb_feed = graph.get_connections("232990736786590", "feed", { :limit => 20} )
    jams = []
    fb_feed.each do |post|
      jams << post unless ( post.nil? || post['source'].nil? )
    end
    jams
  end

end
