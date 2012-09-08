class Course < ActiveRecord::Base
  attr_accessible :description, :full_title, :short_title
end
