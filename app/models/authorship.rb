class Authorship < ActiveRecord::Base
  attr_accessible :author_id, :reference_id
  belongs_to :reference
  belongs_to :author
end