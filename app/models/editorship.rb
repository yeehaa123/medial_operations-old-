# == Schema Information
#
# Table name: editorships
#
#  id           :integer          not null, primary key
#  author_id    :integer
#  reference_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Editorship < ActiveRecord::Base
  attr_accessible :author_id, :reference_id

  belongs_to :author
  belongs_to :reference
end
