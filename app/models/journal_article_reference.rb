class JournalArticleReference < Reference
  attr_accessible :journal

  belongs_to :journal, class_name: 'JournalReference', foreign_key: :type_id

  validates_presence_of :journal
end
