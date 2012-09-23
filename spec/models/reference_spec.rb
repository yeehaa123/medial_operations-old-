require 'spec_helper'

describe Reference do
  let(:reference) { build(:reference) }

  subject { reference }
  
  it { should respond_to(:authors) }
  it { should respond_to(:title) }
  it { should respond_to(:date) }
  it { should respond_to(:medium) }
  it { should respond_to(:site_articles) }
  it { should respond_to(:courses) }
  it { should respond_to(:sessions) }
  it { should be_valid }
  
  context "author with references" do
    let(:reference) { build(:defined_reference) }
    
    it { should be_valid }

    it { should have(2).authors } 
    it { should have(3).sessions } 
    it { should have(4).site_articles }

    its(:to_s) { should == "#{ reference.authors.first.last_name}, #{ reference.authors.first.first_name}. 
    \"#{ reference.title }\". #{ reference.date.strftime("%Y") }. #{ reference.medium.titleize }" }
  end
end