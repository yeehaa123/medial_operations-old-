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
#

class Magazine < Periodical
  attr_accessible :name, :articles
  
  has_many :articles, class_name: 'MagazineArticleReference', source: :references
end
