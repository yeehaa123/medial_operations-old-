class Coauthorship < ActiveRecord::Base
  attr_accessible :author_id, :reference_id

  belongs_to :author
  belongs_to :reference
end
