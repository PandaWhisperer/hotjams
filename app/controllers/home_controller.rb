class HomeController < ApplicationController
  def index
  	@graph = Koala::Facebook::API.new('CAACEdEose0cBAK0I0zofqf1Iwj3ZAQ4Hksrc7tFXYf39fNwtpnfWRQmliPOXZBY15Pz9poQZCmJzlCKzjmo0OJOkf3St3jySPJncSUWcdKt2RbyFoEoEz6pjkUbLGPDFerj1i249pUlcFkJTx6degNFlTd3qNXDvVaVNVH55gZDZD')
  	@feed = @graph.get_connections("232990736786590", "feed", { :limit => 50} )
  end
end
