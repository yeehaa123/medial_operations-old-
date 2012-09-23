class Reference < ActiveRecord::Base
  attr_accessible :date, :medium, :title, :authors, :site_articles, :courses, :type_id, :authors_attributes
  
  has_many :authorships
  has_many :authors, through: :authorships
  has_many :cited_works
  has_many :site_articles, through: :cited_works, source: :article
  has_many :readings
  has_many :sessions, through: :readings
  has_many :courses, through: :sessions, uniq: true

  accepts_nested_attributes_for :authors
  
  validates_presence_of :authors

  def to_s
    "#{ authors.first.last_name}, #{ authors.first.first_name}. 
    \"#{ title }\". #{ date.strftime("%Y") }. #{ medium.titleize }"
  end
end