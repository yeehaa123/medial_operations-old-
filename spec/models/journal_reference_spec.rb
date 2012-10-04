require 'spec_helper'

describe JournalReference do
  let(:reference) { build(:journal_reference) }

  subject { reference }

  it { should be_kind_of(Reference) }
  it { should respond_to(:articles) }

  it { should validate_presence_of(:publisher) }

  it { should be_valid }
  
  context "defined reference" do
    let(:reference) { build(:defined_journal_reference) }
    
    it { should be_valid }

    it { should be_a_collection}
    
    it { should have(2).authors }
    it { should have(3).sessions } 
    it { should have(4).site_articles }
    it { should have(5).articles }
  end
end