# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publisher < ActiveRecord::Base
  attr_accessible :location, :name, :published, :references

  has_many  :publisheds
  has_many  :references, through: :publisheds

  validates_presence_of :name
  validates_presence_of :location
  validates_uniqueness_of :location, scope: :name

  def to_s
    "#{ location.titleize }: #{ name.titleize }"
  end
end
