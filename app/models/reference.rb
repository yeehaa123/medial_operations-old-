class Reference < ActiveRecord::Base
  scope :collections, where(collection: true)
  scope :individuals, where(collection: false)
  scope :list, joins(:authors).order(:last_name)

  attr_accessible :date, :medium, :title, :authors, :site_articles, :courses, :type_id, 
                  :authors_attributes, :collection, :publisher, :author
  
  has_many  :authorships
  has_many  :authors, through: :authorships, uniq: true
  has_one   :published
  has_one   :publisher, through: :published
  has_many  :cited_works
  has_many  :site_articles, through: :cited_works, source: :article
  has_many  :readings
  has_many  :sessions, through: :readings
  has_many  :courses, through: :sessions, uniq: true

  accepts_nested_attributes_for :authors
  
  validates_presence_of    :authors
  validates_presence_of    :title

  def to_s
    "#{ authors.first }. 
    \"#{ title }\". #{ publisher }. 
    #{ date.strftime("%Y") }. #{ medium.titleize }"
  end
end