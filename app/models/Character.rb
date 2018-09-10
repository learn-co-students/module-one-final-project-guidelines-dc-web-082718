class Character < ActiveRecord::Base
# A character belongs to a movie
# A character belongs to an actor
  belongs_to :actor
  belongs_to :movie

end
