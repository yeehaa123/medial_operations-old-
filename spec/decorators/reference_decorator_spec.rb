require 'spec_helper'

describe ReferenceDecorator do
  let(:reference) { build(:reference) }
  let(:dec_ref) { ReferenceDecorator.new(reference) }
  
  subject { dec_ref }

  it { should respond_to(:reference) }
  it { should respond_to(:authors) }
  it { should respond_to(:author_list) }
  it { should respond_to(:title) }
  it { should respond_to(:medium) }
  it { should respond_to(:date) }
  it { should respond_to(:collection) }
  it { should respond_to(:publisher) }
  it { should respond_to(:site_articles) }
  it { should respond_to(:sessions) }
  it { should respond_to(:courses) }

  context "mla formatted references" do
 
    context "authors" do
      it "with same author as previous reference" do
        dec_ref.author_list(true).should == "---"
      end

      describe "with one author" do
        its(:author_list) { should == "#{ reference.authors.first }" }
      end
      
      describe "with two authors" do
        let(:reference) { build(:two_authors) }

        its(:author_list) do
          first_author = reference.authors.first
          second_author = reference.authors.last.full_name
          should == "#{ first_author } and #{ second_author }"
        end
      end

      describe "with three authors" do
        let(:reference) { build(:three_authors) }

        its(:author_list) do
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

    context "title" do

      describe "if reference is a collection" do
        let(:reference) { build(:monograph_reference) }
        its(:title) { should == "<em>#{ reference.title.titleize }</em>" }
      end
      
      describe "if reference is not a collection" do
        let(:reference) { build(:chapter_reference) }
        
        it "should include monograph in reference" do
          chapter_title = "\"#{ reference.title.titleize }.\" "
          monograph_title = "<em>#{reference.monograph.title }</em>"
          dec_ref.title.should == chapter_title + monograph_title
        end
      end
    end
    
    context "other attributes" do
      its(:publisher)   { should == "#{ reference.publisher }" }
      its(:year)        { should == "#{ reference.date.strftime("%Y") }" }
      its(:medium)      { should == "#{ reference.medium.capitalize }" }
    end

    context "formatted reference" do
      let(:reference) { build(:chapter_reference) }
      
      it "should output a correct mla reference" do 
        s =  "#{ dec_ref.author_list }. "
        s += "#{ dec_ref.title }. "
        s += "#{ dec_ref.publisher }, "
        s += "#{ dec_ref.year }. " 
        s += "#{ dec_ref.medium }."
        dec_ref.to_mla.should == s
      end
        
      it "should output --- when author is same" do
        s =  "---. "
        s += "#{ dec_ref.title }. "
        s += "#{ dec_ref.publisher }, "
        s += "#{ dec_ref.year }. " 
        s += "#{ dec_ref.medium }."
        dec_ref.to_mla(true).should == s
      end
    end
  end
end