class HomeController < ApplicationController
  def index
  	@feed = Jam.order(:created_at)
  end
end
