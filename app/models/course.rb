class Course < ActiveRecord::Base
  attr_accessible :title, :full_title, :description, :sections, :sessions

  has_many :sections, dependent: :destroy
  has_many :sessions

  validates_presence_of :title
  validates_presence_of :full_title

  
  def to_s
    full_title
  end
end