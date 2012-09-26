require 'spec_helper'

describe CourseDecorator do
  let(:course) { build(:course) }

  subject { CourseDecorator.new(course) }

  it { should respond_to(:course) }
  it { should respond_to(:sections) }
  it { should respond_to(:sessions) }
  it { should respond_to(:description) }
  it { should respond_to(:title_prefix) }
  it { should respond_to(:heading) }
  
  context "undefined course" do
    its(:description)   { should be_nil }
    its(:title_prefix)  { should be_nil }
    its(:heading)       { should == "#{ course }" }
  end

  context "defined course" do
    let(:course) { CourseDecorator.new(build(:defined_course)) }

    its(:description)   { should == "<p><p>Hello <em>World</em></p>\n</p>" }
    its(:title_prefix)  { should == "12345:" }
  end
end