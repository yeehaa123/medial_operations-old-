# == Schema Information
#
# Table name: references
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  date       :date
#  medium     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string(255)
#  type_id    :integer
#  collection :boolean          default(FALSE)
#

class ChapterReference < Reference
  attr_accessible :monograph

  belongs_to :monograph, class_name: 'MonographReference', foreign_key: :type_id

  validates_presence_of :monograph
end
