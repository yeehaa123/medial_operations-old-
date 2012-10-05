require 'spec_helper'

describe JournalArticleReference do
  let(:reference) { build(:journal_article_reference) }

  subject { reference }

  it { should be_kind_of(Reference) }
  it { should respond_to(:journal) }

  it { should validate_presence_of(:journal) }
  it { should validate_presence_of(:authors) }

  it { should be_valid }
  
  context "defined reference" do
    let(:reference) { build(:defined_journal_article_reference) }
    
    it { should be_valid }

    it { should_not be_a_collection}
    
    it { should have(2).authors }
    it { should have(3).sessions } 
    it { should have(4).site_articles }
  end
end