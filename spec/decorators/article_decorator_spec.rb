require 'spec_helper'

describe ArticleDecorator do
  let(:article) { build(:article) }

  subject { ArticleDecorator.new(article) }

    it { should respond_to(:article) }
  it { should respond_to(:heading) }
  it { should respond_to(:description) }
  it { should respond_to(:cited_works) }
  
  context "undefined course" do
    its(:heading)      { should == "New Article" }
    its(:cited_works)  { should be_blank }
  end

  context "defined course" do
    let(:article) { CourseDecorator.new(create(:defined_article)) }

    its(:heading)      { should == "New Title" }
    its(:cited_works)  { should == "" }
  end
end