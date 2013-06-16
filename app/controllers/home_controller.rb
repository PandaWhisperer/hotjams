class HomeController < ApplicationController
  def index
  	@oauth = Koala::Facebook::OAuth.new('136929479838758', 'e6d7efb8098c019e4647c9e2563ce753')
  end
end
