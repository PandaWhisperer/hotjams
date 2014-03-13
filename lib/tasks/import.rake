desc "import jams"
task :import => :environment do
	
	Jam.fetchAllFromFB.each do |post|

		user = User.where( name: post['from']['name'], fb_id: post['from']['id'] ).first_or_create!
		
		jam = Jam.create( name: post['name'], picture: post['picture'], source: post['source'], user: user )
		jam.update_attributes( created_at: post['created_time'], updated_at: post['updated_time'] )
	end
end