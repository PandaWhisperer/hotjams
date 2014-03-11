desc "import jams"
task :import => :environment do
	Jam.fetchAllFromFB.each do |j|
		Jam.create( name: j['name'], picture: j['picture'], source: j['source'], user: User.where( name: j['from']['name'], fb_id: j['from']['id'] ).first_or_create )
	end
end