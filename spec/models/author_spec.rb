require 'spec_helper'

describe Author do
  let(:author) { create(:author) }

  subject { author }

  it { should respond_to(:references) }
  it { should respond_to(:first_name) }
  it { should respond_to(:middle_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:references) } 

  it { should validate_uniqueness_of(:last_name).scoped_to(:first_name, :middle_name) }

  it { should be_valid } 

  its(:to_s) do
    last_name = author.last_name.capitalize
    first_name = author.first_name.capitalize
    should == "#{ last_name }, #{ first_name }"
  end
  
  context "author with references" do
    let(:author) { build(:author_with_references) }

    it { should have(5).references }
  end
end