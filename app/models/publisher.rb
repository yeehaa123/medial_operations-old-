class Publisher < ActiveRecord::Base
  attr_accessible :location, :name, :published, :references
  
  has_many  :publisheds
  has_many  :references, through: :publisheds
end