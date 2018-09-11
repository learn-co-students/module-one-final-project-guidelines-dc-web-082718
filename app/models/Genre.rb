class Genre < ActiveRecord::Base
# A genre has many movies
  has_many :movies
end
