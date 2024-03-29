# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

require 'spec_helper'

describe Article do
  let(:article) { create(:article) }

  subject { article }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:references) }
  
  it { should be_valid}

  it { should validate_presence_of(:title) }
  
  it { "#{ article }".should == article.title }
  
  context "defined article" do 
    let(:article) { create(:defined_article) }
    
    it { should be_valid }
    
    describe "with markdown content" do
      its(:title) { "#{ article.title }".should == "New Title" }
    end
    
    it { should have(5).references }
  end
end
