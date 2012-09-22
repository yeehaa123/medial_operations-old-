class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :references, :referencable
  has_many :authorships
  has_many :references, through: :authorships
end