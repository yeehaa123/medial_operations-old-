class ChapterReference < Reference
  attr_accessible :monograph

  belongs_to :monograph, class_name: 'MonographReference', foreign_key: :type_id

  validates_presence_of :monograph

  def to_s
    "#{ author }.
    \"#{ title }\" in <em>#{ monograph.title }</em>.
    #{ monograph.publisher }.
    #{ monograph.date.strftime("%Y") }. #{ monograph.medium.titleize }"
  end
end