class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAFUTaOwthTavprQbPmMiGlPgj7ZBrCmKAhmLJ1GJHrqFufLs2wOZAcwXWD3zvq3z6ozKKQbMjOuUcYQZAH39Ag30HEZAYvqhfSKmEDXC4g0Qjxt8Ofjiqbmq8jhBts4LZCv6XIZBFfi3wdeDJr8b8ZD')
  	@feed = @graph.get_connections("232990736786590", "feed", { :limit => 1} )
  end
end
