# == Schema Information
#
# Table name: references
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  date          :date
#  medium        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  type          :string(255)
#  type_id       :integer
#  collection    :boolean          default(FALSE)
#  pages         :string(255)
#  volume        :integer
#  issue         :integer
#  isbn          :string(255)
#  url           :string(255)
#  publisher_id  :integer
#  periodical_id :integer
#

class Reference < ActiveRecord::Base
  scope :individuals, where(collection: false)
  scope :collections, where(collection: true)
  scope :year, order('date')
  scope :auth, includes(:authors).order('authors.last_name')

  default_scope auth.year

  after_initialize { self.medium = "Print" }

  attr_accessible :date, :medium, :title, :authors, :site_articles, :courses,
                  :type_id, :collection, :publisher, :published, :translators, :editors,
                  :pages, :volume, :issue, :url, :publisher_id, :periodical_id

  has_many    :authorships
  has_many    :authors, through: :authorships
  has_many    :translatorships
  has_many    :translators, through: :translatorships, source: :author
  has_many    :editorships
  has_many    :editors, through: :editorships, source: :author
  has_many    :cited_works
  has_many    :site_articles, through: :cited_works, source: :article
  has_many    :readings
  has_many    :sessions, through: :readings
  has_many    :courses, through: :sessions

  validates_presence_of  :authors, if: :author_needed?
  validates_presence_of  :title

  def to_s
    "#{ authors.first } - #{ title }"
  end

  def author_needed?
    self.respond_to?(:magazine) == false
  end
end
