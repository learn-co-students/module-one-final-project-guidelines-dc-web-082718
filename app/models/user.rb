class User < ActiveRecord::Base
  belongs_to :personality
  has_many :memes, through: :personality
end
