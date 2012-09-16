require 'spec_helper'

describe Course do

  let(:course) { FactoryGirl.create(:course) }

  subject { course }

  it { should respond_to(:title) }
  it { should respond_to(:full_title) }
  it { should respond_to(:description) }
  it { should respond_to(:sections) }
  it { should respond_to(:sessions) }
  
  it { should be_valid}

  it { should validate_presence_of(:title) }

  it { "#{ course }".should == course.title }
end