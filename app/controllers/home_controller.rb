class HomeController < ApplicationController
  def index
  	@feed = Jam.fetchAllFromFB
  end
end
