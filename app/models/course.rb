class Course < ActiveRecord::Base
  attr_accessible :description, :full_title, :short_title, :sections

  has_many :sections
  
  def to_s
    short_title
  end
end