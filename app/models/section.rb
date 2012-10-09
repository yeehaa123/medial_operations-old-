# == Schema Information
#
# Table name: sections
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  number      :integer
#  slug        :string(255)
#

class Section < ActiveRecord::Base
  include FriendlyId

  default_scope includes(:meetings).order(:number)

  attr_accessible :description, :title, :course_id, :number, :course, :meetings

  belongs_to :course
  has_many :meetings
  has_many :references, through: :meetings

  validates_presence_of :title

  validates_presence_of :number
  validates_uniqueness_of :number, scope: :course_id

  friendly_id :to_s, use: :slugged

  def to_s
    "#{ number } - #{ title }"
  end
end
