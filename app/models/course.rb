# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  title        :string(255)
#  description  :text
#  slug         :string(255)
#  title_prefix :string(255)
#

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
