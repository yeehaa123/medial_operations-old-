class MonographReference < CollectionReference
  attr_accessible :chapter_references

  has_many :chapters, class_name: 'ChapterReference', foreign_key: :type_id
end