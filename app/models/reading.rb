# == Schema Information
#
# Table name: readings
#
#  id           :integer          not null, primary key
#  reference_id :integer
#  meeting_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Reading < ActiveRecord::Base
  attr_accessible :meeting_id, :reference_id

  belongs_to :reference
  belongs_to :meeting
end
