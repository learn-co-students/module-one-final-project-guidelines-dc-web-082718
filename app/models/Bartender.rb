class Bartender < ActiveRecord::Base
  # has many drinks through bartender_drink
  belongs_to :bar
  has_many :bartender_drinks
  has_many :drinks, through: :bartender_drinks

end
