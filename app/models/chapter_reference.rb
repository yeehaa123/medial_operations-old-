class ChapterReference < Reference
  attr_accessible :monograph

  belongs_to :monograph, class_name: 'MonographReference', foreign_key: :type_id

  validates_presence_of :monograph

  def to_s
    if coauthors.count >= 1
      "#{ author } and #{ coauthors.first.full_name }.
      \"#{ title }\" in <em>#{ monograph.title }</em>.
      #{ monograph.publisher }.
      #{ monograph.date.strftime("%Y") }. #{ monograph.medium.titleize }"    
    else
      "#{ author }. 
      \"#{ title }\". in <em>#{ monograph.title }</em>. 
      #{ publisher }. 
      #{ date.strftime("%Y") }. #{ medium.titleize }"
    end
  end
end