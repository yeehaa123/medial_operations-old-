require 'spec_helper'

describe Reference do
  let(:reference) { build(:reference) }

  subject { reference }
  
  it { should respond_to(:author) }
  it { should respond_to(:coauthors)}
  it { should respond_to(:title) }
  it { should respond_to(:publisher) }
  it { should respond_to(:date) }
  it { should respond_to(:medium) }
  it { should respond_to(:site_articles) }
  it { should respond_to(:courses) }
  it { should respond_to(:sessions) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }

  it { should be_valid }
  
  context "defined reference" do
    let(:reference) { build(:defined_reference) }
    

    it { should be_valid }
    
    it { should have(2).coauthors }
    it { should have(3).sessions }  
    it { should have(4).site_articles }

    its(:to_s) { should == "#{ reference.author }. 
    \"#{ reference.title }\". #{ reference.publisher }. 
    #{ reference.date.strftime("%Y") }. #{ reference.medium.titleize }" }
  end
end