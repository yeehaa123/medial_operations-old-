class RightCourseValidator < ActiveModel::Validator
  def validate(record)
    unless record.section.course_id == record.course_id
      record.errors[:section] << 'section needs to belong to same course'
    end
  end
end

class Session < ActiveRecord::Base
  # default_scope order(:number)

  attr_accessible :description, :title, :number, :section_id, :course_id, :course,
                :section, :location, :date, :start_time, :end_time

  belongs_to :section
  belongs_to :course
  has_many :readings
  has_many :references, through: :readings
  has_many :authors, through: :references

  
  validates_presence_of :course_id
  validates_with RightCourseValidator, if: :section_id

  def to_s
    "#{ self.number } - #{ self.title.titleize }"
  end
end