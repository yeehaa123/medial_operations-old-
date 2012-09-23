class CitedWork < ActiveRecord::Base
  attr_accessible :article_id, :reference_id

  belongs_to :article
  belongs_to :reference
end
