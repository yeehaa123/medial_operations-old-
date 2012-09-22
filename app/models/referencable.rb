class Referencable < ActiveRecord::Base
  attr_accessible :article_id, :reference_id, :course_id

  belongs_to :article
  belongs_to :reference
  belongs_to :course
end
