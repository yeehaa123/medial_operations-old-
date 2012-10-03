# == Schema Information
#
# Table name: authorships
#
#  id           :integer          not null, primary key
#  reference_id :integer
#  author_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Authorship do
  let(:author)      { build(:author) }
  let(:reference)   { build(:reference) }
  let(:authorship)  { author.authorships.build(reference_id: reference.id) }

  subject { authorship }

  it { should be_valid }
end
