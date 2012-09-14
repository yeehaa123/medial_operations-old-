class Course < ActiveRecord::Base
  attr_accessible :title, :full_title, :description, :sections, :sessions

  has_many :sections, class_name: "CourseSection", dependent: :destroy
  has_many :sessions

  validates_presence_of :title
  
  def to_s
    title
  end
end