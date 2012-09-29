class Publisher < ActiveRecord::Base
  attr_accessible :location, :name, :published, :references

  has_many  :publisheds
  has_many  :references, through: :publisheds

  validates_presence_of :name
  validates_presence_of :location
  validates_uniqueness_of :location, scope: :name

  def to_s
    "#{ name.titleize }: #{ location.titleize }"
  end
end