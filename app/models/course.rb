class Course < ActiveRecord::Base
  include FriendlyId
  attr_accessible :title, :title_prefix, :description, :sections, :sessions, :references
  
  has_many :sections, dependent: :destroy
  has_many :sessions
  has_many :references, through: :sessions
  has_many :authors, through: :references

  validates_presence_of :title
  
  friendly_id :title, use: :slugged
  
  def to_s
    title
  end
end