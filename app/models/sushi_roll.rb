class SushiRoll < ApplicationRecord
  belongs_to :user
  validates_presence_of :price, :fish_type, :spicy, :name
   
end








