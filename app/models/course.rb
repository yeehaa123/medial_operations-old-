class Course < ActiveRecord::Base
  include FriendlyId
  attr_accessible :title, :full_title, :description, :sections, :sessions

  has_many :sections, dependent: :destroy
  has_many :sessions

  validates_presence_of :title
  validates_presence_of :full_title
  
  friendly_id :title, use: :slugged
  
  def to_s
    full_title
  end
end