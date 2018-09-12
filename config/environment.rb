require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../db/greatest_albums.db')
require_all 'lib'
