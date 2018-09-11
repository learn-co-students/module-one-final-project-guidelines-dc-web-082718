class BartenderDrink < ActiveRecord::Base
  belongs_to :bartender
  belongs_to :drink
end 
