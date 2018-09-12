class Genre < ActiveRecord::Base
  has_many :album_genres
  has_many :albums, through: :album_genres
  has_many :artists, through: :albums #should this include album_genre?

end
