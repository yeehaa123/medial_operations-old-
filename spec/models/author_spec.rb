require 'spec_helper'

describe Author do
  let(:author) { build(:author) }

  subject { author }

  it { should respond_to(:references) }

  it { should be_valid }

  context "author with references" do
    let(:author) { build(:author_with_references) }
    
    it { should have(5).references }
  end
end