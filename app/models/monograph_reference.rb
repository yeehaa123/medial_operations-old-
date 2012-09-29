class MonographReference < Reference
  attr_accessible :chapters

  has_many :chapters, class_name: 'ChapterReference', foreign_key: :type_id

  after_initialize { self.collection = true }
  before_save { self.collection = true }
  validates_presence_of :publisher

  # def to_s
  #   "#{ authors.first }. <em>#{ title }</em>.
  #   #{ publisher }.
  #   #{ date.strftime("%Y") }. #{ medium.titleize }"
  # end
end