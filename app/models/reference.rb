# == Schema Information
#
# Table name: references
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  date       :date
#  medium     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string(255)
#  type_id    :integer
#  collection :boolean          default(FALSE)
#  pages      :string(255)
#

class Reference < ActiveRecord::Base
  scope :individuals, where(collection: false)
  scope :collections, where(collection: true)
  scope :year, order('date')
  scope :auth, includes(:authors).order('authors.last_name')

  default_scope auth.year

  attr_accessible :date, :medium, :title, :authors, :site_articles, :courses, :type_id,
                  :collection, :publisher, :translators, :editors, :pages

  has_many  :authorships
  has_many  :authors, through: :authorships
  has_many  :translatorships
  has_many  :translators, through: :translatorships, source: :author
  has_many  :editorships
  has_many  :editors, through: :editorships, source: :author
  
  has_one   :published
  has_one   :publisher, through: :published
  has_many  :cited_works
  has_many  :site_articles, through: :cited_works, source: :article
  has_many  :readings
  has_many  :sessions, through: :readings
  has_many  :courses, through: :sessions

  validates_presence_of  :authors
  validates_presence_of  :title

  def to_s
    "#{ authors.first } - #{ title }"
  end
end
