class Bar < ActiveRecord::Base
  has_many :bartenders
  # has_many: :drinks through: :bartenders
end
