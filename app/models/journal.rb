# == Schema Information
#
# Table name: periodicals
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  publisher_id :integer
#  type         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  medium       :string(255)
#

class Journal < Periodical
  attr_accessible :articles

  has_many :articles, class_name: 'JournalArticleReference', foreign_key: :type_id

  # # after_initialize { self.collection = true }
  # # before_save { self.collection = true }
  # # # before_validation { self.authors = [] }

  validates_presence_of :publisher
end
