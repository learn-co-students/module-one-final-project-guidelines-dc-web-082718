class Director < ActiveRecord::Base
# A director has many movies
  has_many :movies

end
