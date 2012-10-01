require 'spec_helper'

describe ApplicationHelper do
  include Haml::Helpers  
  include ActionView::Helpers  

  describe "markdown" do
    it "should convert markdown to html" do
      kramdown("Hi").should == "<p>Hi</p>\n"
    end
  end

  describe "roman_numeral" do
    it { roman_numeral(4).should == "IV"}
    it { roman_numeral(49).should == "XLIX"}
    it { roman_numeral(857).should == "DCCCLVII" }
  end

  describe "works_cited" do
    let(:bibliography)    { capture_haml { works_cited([]) } }

    subject { bibliography }

    before(:each) do
      init_haml_helpers
    end

    context "title" do


      describe "default title" do
        it { should include("<h1>Works Cited</h1>") }
      end

      describe "with an alternative title provided" do
        let(:bibliography) { capture_haml { works_cited([], "Readings") } }

        it { should include("<h1>Readings</h1>") }
        it { should_not include "<h1>Works Cited</h1>" }
      end
    end

    describe "list of references" do
      let(:reference1)    { stub authors: ["Me"], title: "Title", collection: true, 
                            publisher: "", date: Time.now, medium: "Print" }
      let(:reference2)    { stub authors: ["You"], title: "Title", collection: true, 
                            publisher: "", date: Time.now, medium: "Print" }
      let(:references)    { [reference1, reference2] }
      let(:dec_refs)      { ReferenceDecorator.decorate(references) }
      let(:bibliography)  { capture_haml { works_cited(dec_refs) } }

      it { should include("Me") }

      describe "two identical authors" do
        let(:reference2)    { stub authors: ["Me"], title: "Title", collection: true, 
                            publisher: "", date: Time.now, medium: "Print" }
        it { should include("---.") }
        it { should include("Me") }
        it { should_not include("You") }
      end
    end
  end
end