class Movie < ActiveRecord::Base
# A movie has one cast
# A movie has many actors through its cast
# A movie belongs to a director
  has_many :characters
  belongs_to :director
  has_many :actors, through: :characters

end
