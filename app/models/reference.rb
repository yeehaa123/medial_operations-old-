class Reference < ActiveRecord::Base
  scope :collections, where(collection: true)
  scope :individuals, where(collection: false)
  scope :year, order(:date)

  default_scope joins(:author).order(:last_name).year.readonly(false)

  attr_accessible :date, :medium, :title, :authors, :site_articles, :courses, :type_id, 
                  :authors_attributes, :collection, :publisher, :author, :coauthors
  
  has_one   :authorship
  has_one   :author, through: :authorship
  has_many  :coauthorships
  has_many  :coauthors, through: :coauthorships, source: :author
  has_one   :published
  has_one   :publisher, through: :published
  has_many  :cited_works
  has_many  :site_articles, through: :cited_works, source: :article
  has_many  :readings
  has_many  :sessions, through: :readings
  has_many  :courses, through: :sessions
  
  validates_presence_of  :author
  validates_presence_of  :title
end