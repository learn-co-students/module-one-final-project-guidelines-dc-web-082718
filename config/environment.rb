require 'bundler'
Bundler.require

require 'open-uri'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

# Giving all my files access to each other and shizz
require_all 'lib'
require_all 'app'
