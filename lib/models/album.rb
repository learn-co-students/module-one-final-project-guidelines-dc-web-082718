class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :album_genres
  has_many :genres, through: :album_genres
end
