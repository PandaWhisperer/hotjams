class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAPwj0qTlnzPll0ys2xTUkgMnvrqPzkm5AkzeaoKlj0UYgVy261oIHzi9SCbZBo170RAF9DCS62pIruxBngNKZBLhpZAMwfCuRfOBvgwbw5ZC7dIJnHKpsL20lrZAz1DlhfHg6bm641jNi8jN7ajjlQvGejBlO6QZDZD')
  	fb_feed = @graph.get_connections("232990736786590", "feed", { :limit => 20} )
  	@feed = []
  	fb_feed.each do |post|
  		@feed << post unless ( post.nil? || post['source'].nil? )
  	end
  end
end
