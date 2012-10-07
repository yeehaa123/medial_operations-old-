# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  middle_name :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  particle    :string(255)
#

class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :middle_name, :references,
                  :translations, :volumes, :particle
  before_validation :format_name
  after_initialize :format_name

  has_many  :authorships
  has_many  :references, through: :authorships
  has_many  :translatorships
  has_many  :translations, through: :translatorships, source: :reference
  has_many  :editorships
  has_many  :volumes, through: :editorships, source: :reference

  validates_length_of :middle_name, minimum: 1, allow_nil: true
  validates_uniqueness_of :last_name, scope: [:first_name, :middle_name]

  def format_name
    self.last_name = last_name.downcase.titleize if last_name
    self.middle_name = middle_name.downcase.titleize if middle_name
    self.first_name = first_name.downcase.titleize if first_name
  end

  def to_s
    s = "#{ last_name }, #{ first_name }"
    s += " #{ particle }" if particle
    s
  end

  def full_name
    if particle
      "#{ first_name } #{ particle } #{ last_name }"
    else
      "#{ first_name } #{ last_name }"
    end  
  end
end
