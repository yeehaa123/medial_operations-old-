# == Schema Information
#
# Table name: authorships
#
#  id           :integer          not null, primary key
#  reference_id :integer
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Authorship < ActiveRecord::Base
  attr_accessible :author_id, :reference_id
  belongs_to :reference
  belongs_to :author
end
