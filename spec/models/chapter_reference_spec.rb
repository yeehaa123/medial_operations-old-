# == Schema Information
#
# Table name: references
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  date       :date
#  medium     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string(255)
#  type_id    :integer
#  collection :boolean          default(FALSE)
#

require 'spec_helper'

describe ChapterReference do
  let(:reference) { build(:chapter_reference) }

  subject { reference }

  it { should be_kind_of(Reference) }
  it { should respond_to(:monograph) }

  it { should be_valid }
  
  context "defined reference" do
    let(:reference) { create(:defined_chapter_reference) }
    
    it { should be_valid }

    it { should_not be_a_collection}
    
    it { should have(2).authors }
    it { should have(3).sessions } 
    it { should have(4).site_articles }
  end
end
