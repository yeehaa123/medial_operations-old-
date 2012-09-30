require 'spec_helper'

describe ReferenceDecorator do
  let(:reference) { build(:reference) }
  let(:dec_ref) { ReferenceDecorator.new(reference) }
  
  subject { dec_ref }

  it { should respond_to(:reference) }
  it { should respond_to(:authors) }
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
    its(:authors)     { should == "#{ reference.authors.first }" }
    its(:title)       { should == "#{ reference.title.titleize }" }
    its(:publisher)   { should == "#{ reference.publisher }" }
    its(:year)        { should == "#{ reference.date.strftime("%Y") }" }
    its(:medium)      { should == "#{ reference.medium.capitalize }" }

    its(:to_s) do 
      s =  "#{ dec_ref.authors }. "
      s += "#{ dec_ref.title }. "
      s += "#{ dec_ref.publisher }. "
      s += "#{ dec_ref.year }. " 
      s += "#{ dec_ref.medium }."
      should == s
    end
  end

  context "multiple authors" do
    describe "two authors" do
      let(:reference) { build(:two_authors) }

      its(:authors) do
        first_author = reference.authors.first
        second_author = reference.authors.last.full_name
        should == "#{ first_author } and #{ second_author }"
      end
    end

    describe "three authors" do
      let(:reference) { build(:three_authors) }

      its(:authors) do
        a1, a2, a3, a4 = []
        reference.authors.each_with_index do |a, i|
          case i
            when 0 then a1 = a
            when 1 then a2 = a
            when 2 then a3 = a
          end
        end
        should == "#{ a1 }, #{ a2.full_name }, and #{ a3.full_name }"
      end
    end
  end
end