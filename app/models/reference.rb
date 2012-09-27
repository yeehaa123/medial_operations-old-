class Reference < ActiveRecord::Base
  scope :collections, where(collection: true)
  scope :individuals, where(collection: false)
  scope :list, joins(:author).order(:last_name)

  attr_accessible :date, :medium, :title, :authors, :site_articles, :courses, :type_id, 
                  :authors_attributes, :collection, :publisher, :author
  
  has_one   :authorship
  has_one   :author, through: :authorship
  has_many  :coauthorships
  has_many  :coauthors, through: :coauthorships, source: :authors
  has_one   :published
  has_one   :publisher, through: :published
  has_many  :cited_works
  has_many  :site_articles, through: :cited_works, source: :article
  has_many  :readings
  has_many  :sessions, through: :readings
  has_many  :courses, through: :sessions, uniq: true
  
  validates_presence_of    :author
  validates_presence_of    :title

  def to_s
    "#{ author }. 
    \"#{ title }\". #{ publisher }. 
    #{ date.strftime("%Y") }. #{ medium.titleize }"
  end
end