# == Schema Information
#
# Table name: publisheds
#
#  id           :integer          not null, primary key
#  publisher_id :integer
#  reference_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Published < ActiveRecord::Base
  attr_accessible :publisher_id, :reference_id

  belongs_to :reference
  belongs_to :publisher
end
