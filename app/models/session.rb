# == Schema Information
#
# Table name: sessions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  number      :integer
#  description :text
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  section_id  :integer
#  location    :string(255)
#  start_time  :datetime
#  end_time    :datetime
#

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
