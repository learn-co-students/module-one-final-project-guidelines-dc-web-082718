class Actor < ActiveRecord::Base
# An actor has many casts
# An actor has many movies through casts
  has_many :characters
  has_many :movies, through: :characters

end
