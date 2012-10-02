# == Schema Information
#
# Table name: readings
#
#  id           :integer          not null, primary key
#  reference_id :integer
#  session_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Reading < ActiveRecord::Base
  attr_accessible :session_id, :reference_id

  belongs_to :reference
  belongs_to :session
end
