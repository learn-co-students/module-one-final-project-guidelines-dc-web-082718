class Personality < ActiveRecord::Base
  has_many :users
  has_many :memes
end
