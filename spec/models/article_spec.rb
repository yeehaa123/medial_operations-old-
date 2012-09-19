require 'spec_helper'

describe Article do
  let(:article) { FactoryGirl.create(:article) }

  subject { article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  
  it { should be_valid}

  it { should validate_presence_of(:title) }
  
  it { "#{ article }".should == article.title }
  
  context "with markdown content" do 
    let(:article) { FactoryGirl.create(:markdown_article) }
    
    it { should be_valid}
    
    its(:title) { "#{ article.title }".should == "New Title" }
  end
end