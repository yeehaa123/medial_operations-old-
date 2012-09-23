class Section < ActiveRecord::Base
  include FriendlyId

  default_scope order(:number)
  
  attr_accessible :description, :title, :course_id, :number, :course
  
  belongs_to :course
  has_many :sessions
  has_many :references, through: :sessions
  
  validates_presence_of :title

  validates_presence_of :number
  validates_uniqueness_of :number, scope: :course_id

  friendly_id :to_s, use: :slugged

  def to_s
    "#{ number } - #{ title }"
  end
end