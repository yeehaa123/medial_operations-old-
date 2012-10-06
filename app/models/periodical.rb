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

class Periodical < ActiveRecord::Base
  attr_accessible :name, :publisher_id, :type, :publisher, :medium

  belongs_to  :publisher
end
