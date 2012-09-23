class Reading < ActiveRecord::Base
  attr_accessible :session_id, :reference_id

  belongs_to :reference
  belongs_to :session
end
