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
  
    its(:to_s) { should == "#{ reference.authors.first } and #{ reference.authors.last.full_name }.
      \"#{ reference.title }\" in <em>#{ reference.monograph.title }</em>.
      #{ reference.monograph.publisher }.
      #{ reference.date.strftime("%Y") }. #{ reference.medium.titleize }" }
  end
end