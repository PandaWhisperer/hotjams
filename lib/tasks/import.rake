desc "import jams"
task :import => :environment do
	Jam.fetchAllFromFB.each do |j|
		Jam.create( name: j['name'], picture: j['picture'], source: j['source'], user: User.where( name: j['from']['name'] ).first_or_create )
	end
end