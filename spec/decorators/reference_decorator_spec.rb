require 'spec_helper'

describe ReferenceDecorator do
  let(:reference) { build(:reference) }
  let(:dec_ref) { ReferenceDecorator.new(reference) }
  
  subject { dec_ref }

  it { should respond_to(:reference) }
  it { should respond_to(:authors) }
  it { should respond_to(:title) }
  it { should respond_to(:medium) }
  it { should respond_to(:date) }
  it { should respond_to(:collection) }
  it { should respond_to(:publisher) }
  it { should respond_to(:site_articles) }
  it { should respond_to(:sessions) }
  it { should respond_to(:courses) }

  context "undefined reference" do
    its(:authors)   { should == "#{ reference.authors.first }" }
    its(:title)     { should == "#{ reference.title.titleize }" }
    its(:publisher) { should == "#{ reference.publisher }" }
    its(:year)      { should == "#{ reference.date.strftime("%Y") }" }
    its(:medium)    { should == "#{ reference.medium.capitalize }" }

    its(:to_s) do 
      s =  "#{ dec_ref.authors }. "
      s += "#{ dec_ref.title }. "
      s += "#{ dec_ref.publisher }. "
      s += "#{ dec_ref.year }. " 
      s += "#{ dec_ref.medium }."
      should == s
    end
  end

  context "defined reference" do
    let(:reference) { build(:defined_reference) }
    let(:dec_ref) { ReferenceDecorator.new(reference) }

    its(:authors)   { should == "#{ reference.authors.first }" }

    its(:to_s) do 
      s =  "#{ dec_ref.authors }. "
      s += "#{ dec_ref.title }. "
      s += "#{ dec_ref.publisher }. "
      s += "#{ dec_ref.year }. " 
      s += "#{ dec_ref.medium }."
      should == s
    end
  end
end