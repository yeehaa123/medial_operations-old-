class MagazineReference < Reference
  attr_accessible :articles

  has_many :articles, class_name: 'MagazineArticleReference', foreign_key: :type_id

  after_initialize { self.collection = true }
  before_save { self.collection = true }
  # before_validation { self.authors = [] }

end