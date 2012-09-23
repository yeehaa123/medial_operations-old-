class ChapterReference < IndividualReference
  attr_accessible :monograph

  belongs_to :monograph, class_name: 'MonographReference', foreign_key: :type_id
end