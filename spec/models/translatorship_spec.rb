# == Schema Information
#
# Table name: translatorships
#
#  id           :integer          not null, primary key
#  author_id    :integer
#  reference_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Translatorship do
  let(:author)      { build(:author) }
  let(:reference)   { build(:reference) }
  let(:tranlatorship)  { author.translatorships.build(reference_id: reference.id) }

  subject { tranlatorship }

  it { should be_valid }
end
