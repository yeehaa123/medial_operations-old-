class CourseSection < ActiveRecord::Base
  attr_accessible :description, :title, :course_id, :number, :course
  
  belongs_to :course
  has_many :sessions, foreign_key: "section_id"
  
  validates_presence_of :title

  validates_presence_of :number
  validates_uniqueness_of :number, scope: :course_id

  def to_s
    title
  end
end