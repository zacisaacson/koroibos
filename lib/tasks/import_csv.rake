require 'csv'

desc "Import olympians from csv files"
task :import_olympians => [:environment] do
  file = "data/olympic_data_2016.csv"
  CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
    row = row.to_hash
    sport = Sport.find_or_create_by(name: row[:sport])
    Olympian.find_or_create_by( name: row[:name],
                      sex: row[:sex],
                      age: row[:age],
                      height: row[:height],
                      weight: row[:weight],
                      team: row[:team],
                      sport_id: sport.id
                    )
  end
end

desc "Import events from csv files"
task :import_events => [:environment] do
  file = "data/olympic_data_2016.csv"
  CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
    row = row.to_hash
    sport = Sport.find_or_create_by(name: row[:sport])
    Event.find_or_create_by( sport_id: sport.id,
                  name: row[:event]
                )
    end
end

desc "Import olympian_events from csv files"
task :import_olympian_events => [:environment] do
  file = "data/olympic_data_2016.csv"
  CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
    row = row.to_hash
    olympian = Olympian.find_or_create_by(name: row[:name])
    event = Event.find_or_create_by(name: row[:event])
    OlympianEvent.create(olympian_id: olympian.id,
                          event_id: event.id,
                          medal: row[:medal])
  end
end

desc "Import sports form csv file"
task :import_sports => [:environment] do
  file = "data/olympic_data_2016.csv"
  CSV.foreach(file, {:headers => true, :header_converters => :symbol}) do |row|
    row = row.to_hash
    Sport.create(name: row[:sport])
  end
end
