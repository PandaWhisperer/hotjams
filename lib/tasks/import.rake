desc "import jams"

require 'uri'

task :import => :environment do
	
	Jam.fetchAllFromFB.each do |post|
		# Store the user
		user = User.where( name: post['from']['name'], fb_id: post['from']['id'] ).first_or_create!
		
		next unless post.has_key?('source')
		uri = URI( post['source'] )
		if uri.host.downcase == "player.soundcloud.com"
			next unless post.has_key?('link')
			uri = URI( post['link'] )
		end
			
		# convert https to http
		uri.scheme = "http"

		# Ignore if it isn't youtube or soundcloud
		puts uri.host.downcase
		next unless ["soundcloud.com", "www.youtube.com"].include? uri.host.downcase

		source = uri.to_s
		puts source

		# Store the jam
		jam = Jam.create( name: post['name'], picture: post['picture'], source: source, user: user )
		# Update the jam's updated and created on time to be consistent with facebook's info
		jam.update_attributes( created_at: post['created_time'], updated_at: post['updated_time'] )
	end
end