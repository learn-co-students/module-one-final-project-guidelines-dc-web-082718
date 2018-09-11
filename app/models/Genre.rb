class Genre < ActiveRecord::Base
# A genre has many movies through a join table
  has_many :genre_movie_join_tables
  has_many :movies, through: :genre_movie_join_tables
end
