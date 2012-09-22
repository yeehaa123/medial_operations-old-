class Course < ActiveRecord::Base
  include FriendlyId
  attr_accessible :title, :title_prefix, :description, :sections, :sessions
  
  has_many :sections, dependent: :destroy
  has_many :sessions
  has_many :referencables
  has_many :references, through: :referencables

  validates_presence_of :title
  
  friendly_id :title, use: :slugged
  
  def to_s
    title
  end
end