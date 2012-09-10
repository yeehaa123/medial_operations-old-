class Section < ActiveRecord::Base
  attr_accessible :description, :title, :course_id, :number
  
  belongs_to :course

  validates_presence_of :number
  validates_uniqueness_of :number, scope: :course_id
end