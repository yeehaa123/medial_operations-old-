class Published < ActiveRecord::Base
  attr_accessible :publisher_id, :reference_id

  belongs_to :reference
  belongs_to :publisher
end