# == Schema Information
#
# Table name: cited_works
#
#  id           :integer          not null, primary key
#  reference_id :integer
#  article_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CitedWork < ActiveRecord::Base
  attr_accessible :article_id, :reference_id

  belongs_to :article
  belongs_to :reference
end
