class JournalReference < Reference
  attr_accessible :articles

  has_many :articles, class_name: 'ArticleReference', foreign_key: :type_id

  after_initialize { self.collection = true }
  before_save { self.collection = true }
  # before_validation { self.authors = [] }

  validates_presence_of :publisher
end