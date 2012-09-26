class ChapterReference < Reference
  attr_accessible :monograph

  belongs_to :monograph, class_name: 'MonographReference', foreign_key: :type_id

  validates_presence_of :monograph

  def to_s
    "#{ authors.first.last_name.capitalize }, #{ authors.first.first_name.capitalize }. 
    \"#{ title }\" in <em>#{ monograph.title }</em>.
    #{ monograph.publisher.name }: #{ monograph.publisher.location }.
    #{ monograph.date.strftime("%Y") }. #{ monograph.medium.titleize }"
  end
end