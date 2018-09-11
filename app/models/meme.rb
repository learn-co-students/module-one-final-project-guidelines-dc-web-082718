class Meme < ActiveRecord::Base
  belongs_to :personality
  has_many :users, through: :personality
end
