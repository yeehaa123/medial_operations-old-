require 'spec_helper'

describe SectionDecorator do
  let(:section) { SectionDecorator.new(build(:section)) }
  
  subject { section }

  it { should respond_to(:section) }
  it { should respond_to(:meetings) }
  
  context "undefined section" do
    its(:heading) do
      h = "#{ section.h.roman_numeral(section.number) }. #{ section.title }"
      should == h
    end

    its(:description) { should be_nil }
  end

  context "defined section" do
    let(:section) do
      SectionDecorator.new(build(:defined_section)) 
    end

    subject { section }

    its(:description) { should == "<p><p>Hello <em>World</em></p>\n</p>" }
  end
end