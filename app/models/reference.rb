class Reference < ActiveRecord::Base
  attr_accessible :date, :medium, :title, :authors, :articles, :courses

  has_many :authorships
  has_many :referencables
  has_many :authors, through: :authorships
  has_many :articles, through: :referencables
  has_many :courses, through: :referencables
end