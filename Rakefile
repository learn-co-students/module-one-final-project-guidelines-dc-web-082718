require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require 'csv'
require_relative 'db/seeds.rb'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

# Is this the correct location for the import of csv and assignment to objects?
desc 'Imports artist data into database and creates ORMs'
task :import_artist do
  ImportCsv.insert_artist_data
end

desc 'Import genre data into database'
task :import_genre do
  ImportCsv.insert_genre_data
end
