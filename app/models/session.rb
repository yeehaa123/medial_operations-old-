class RightCourseValidator < ActiveModel::Validator
  def validate(record)
    unless record.section.course_id == record.course_id
      record.errors[:section] << 'section needs to belong to same course'
    end
  end
end

class Session < ActiveRecord::Base
  attr_accessible :description, :title, :number, :section_id, :course_id, :course,
                :section, :location, :date, :start_time, :end_time

  belongs_to :section, class_name: "CourseSection", 
                       foreign_key: "section_id"
  belongs_to :course
  
  validates_presence_of :course_id
  validates_with RightCourseValidator, if: :section_id

  def to_s
    "#{ number } - #{ title.titleize }"
  end
end