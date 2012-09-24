require 'spec_helper'

describe MonographReference do
  let(:reference) { build(:monograph_reference) }

  subject { reference }

  it { should be_kind_of(Reference) }
  it { should respond_to(:chapters) }

  it { should be_valid }
  
  context "defined reference" do
    let(:reference) { build(:defined_monograph_reference) }
    
    it { should be_valid }

    it { should be_a_collection}

    it { should have(2).authors } 
    it { should have(3).sessions } 
    it { should have(4).site_articles }
    it { should have(5).chapters }
    
    its(:to_s) { should == "#{ reference.authors.first.last_name}, #{ reference.authors.first.first_name}. 
    \"#{ reference.title }\". #{ reference.date.strftime("%Y") }. #{ reference.medium.titleize }" }
  end
end