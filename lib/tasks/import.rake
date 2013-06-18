desc "import jams"
task :import => :environment do
	Jam.fetchAllFromFB.each do |j|
		Jam.create( name: j['name'], picture: j['picture'], source: j['source'], user: User.create( name: j['from']['name'] ) )
	end
end