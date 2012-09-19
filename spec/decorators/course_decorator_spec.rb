require 'spec_helper'

describe CourseDecorator do
  let(:course) { FactoryGirl.create(:course) }

  subject { CourseDecorator.new(course) }

  it { should respond_to(:course) }
  it { should respond_to(:sections) }
  it { should respond_to(:sessions) }
  
  describe "undefined course" do
    its(:description) { should be_nil }
    its(:heading) { should == "#{ course }" }
  end

  describe "defined course" do
    let(:course) do
      CourseDecorator.new(FactoryGirl.create(:defined_course)) 
    end

    subject { course }

    its(:description) { should == "<p><p>Hello <em>World</em></p>\n</p>" }
  end
end