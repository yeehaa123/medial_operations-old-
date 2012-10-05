class MagazineArticleReference < Reference
  attr_accessible :magazine

  belongs_to :magazine, class_name: "MagazineReference", foreign_key: :type_id
  
  validates_presence_of :magazine
end