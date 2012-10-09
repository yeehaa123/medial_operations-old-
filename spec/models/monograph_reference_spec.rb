# == Schema Information
#
# Table name: references
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  date          :date
#  medium        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  type          :string(255)
#  type_id       :integer
#  collection    :boolean          default(FALSE)
#  pages         :string(255)
#  volume        :integer
#  issue         :integer
#  isbn          :string(255)
#  url           :string(255)
#  publisher_id  :integer
#  periodical_id :integer
#

require 'spec_helper'

describe MonographReference do
  let(:reference) { build(:monograph_reference) }

  subject { reference }

  it { should be_kind_of(Reference) }
  it { should respond_to(:chapters) }
  it { should respond_to(:publisher) }
  
  it { should validate_presence_of(:publisher) }
  it { should validate_presence_of(:authors) }

  it { should be_valid }
  
  context "defined reference" do
    let(:reference) { build(:defined_monograph_reference) }
    
    it { should be_valid }

    it { should be_a_collection}
    
    it { should have(2).authors }
    it { should have(3).meetings } 
    it { should have(4).site_articles }
    it { should have(5).chapters }
  end
end
