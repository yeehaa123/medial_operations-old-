# == Schema Information
#
# Table name: editorships
#
#  id           :integer          not null, primary key
#  author_id    :integer
#  reference_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Editorship do
  let(:author)      { build(:author) }
  let(:reference)   { build(:reference) }
  let(:authorship)  { author.authorships.build(reference_id: reference.id) }

  subject { authorship }

  it { should be_valid }
end
