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

    describe "cited works" do
      its(:cited_works) { should be_true }

      describe "checks if the model has references" do
        before { article.references = [] }

        its(:cited_works) { should be_false }
      end

      describe "returns a list of references" do
        let(:reference1) { build(:reference) }
        let(:reference2) { build(:reference) }

        before do 
          article.references = []
          article.references << reference2
          article.references << reference1
        end

        its(:cited_works) { should be_true }
      end
    end
  end
end