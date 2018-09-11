class Bartender < ActiveRecord::Base
  # has many drinks through bartender_drink
  belongs_to :bar
end
