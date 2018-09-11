class Drink < ActiveRecord::Base
  #has many bartenders through bartender_drink join table
  #has many bars through bartender_drink through bartenders
  has_many :bartenders, through: :bartender_drinks
end
