require 'spec_helper'

describe Course do

  let(:course) { build(:course) }

  subject { course }

  it { should respond_to(:title) }
  it { should respond_to(:title_prefix) }
  it { should respond_to(:description) }
  it { should respond_to(:sections) }
  it { should respond_to(:sessions) }
  
  it { should be_valid }

  it { should validate_presence_of(:title) }

  its(:to_s) { should == "#{ course.title }" }

  context "defined course" do
    let(:course) { build(:defined_course) }
    
    it { should have(5).references }
  end
end