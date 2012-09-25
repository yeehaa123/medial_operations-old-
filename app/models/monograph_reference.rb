class MonographReference < Reference
  attr_accessible :chapters

  has_many :chapters, class_name: 'ChapterReference', foreign_key: :type_id

  after_initialize { self.collection = true }
  before_save { self.collection = true }

  def to_s
    "#{ authors.first.last_name}, #{ authors.first.first_name}. 
    \"#{ title }\".
    #{ publisher.name }: #{ publisher.location }.
    #{ date.strftime("%Y") }. #{ medium.titleize }"
  end
end