require 'spec_helper'

describe Reference do
  let(:reference) { build(:reference) }

  subject { reference }
  
  it { should respond_to(:authors) }
  it { should respond_to(:title) }
  it { should respond_to(:date) }
  it { should respond_to(:medium) }

  it { should respond_to(:articles) }
  it { should respond_to(:courses) }
  it { should be_valid }
  
  context "author with references" do
    let(:reference) { build(:defined_reference) }
    
    it { should be_valid }

    it { should have(2).authors } 
    it { should have(3).courses } 
    it { should have(4).articles } 
  end
end