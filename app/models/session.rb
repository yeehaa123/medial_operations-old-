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

  belongs_to :course
  belongs_to :section

  has_many :readings
  has_many :references, through: :readings

  validates_presence_of :course_id
  validates_with RightCourseValidator, if: :section_id

  def to_s
    "#{ self.number } - #{ self.title.titleize }"
  end
end