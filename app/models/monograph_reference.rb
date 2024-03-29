# == Schema Information
#
# Table name: references
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  date          :date
#  medium        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  type          :string(255)
#  type_id       :integer
#  collection    :boolean          default(FALSE)
#  pages         :string(255)
#  volume        :integer
#  issue         :integer
#  isbn          :string(255)
#  url           :string(255)
#  publisher_id  :integer
#  periodical_id :integer
#

class MonographReference < Reference
  attr_accessible :chapters

  has_many   :chapters, class_name: 'ChapterReference', foreign_key: :type_id
  belongs_to :publisher

  after_initialize { self.collection = true }
  before_save { self.collection = true }
  validates_presence_of :publisher
end
