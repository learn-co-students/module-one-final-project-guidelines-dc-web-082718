class BartenderDrink < ActiveRecord::Base
  belongs_to :bartender
  belongs_to :drink
  validates_length_of :bartender_id, maximum: 2
end
